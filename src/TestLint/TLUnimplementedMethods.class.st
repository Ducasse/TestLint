"
This rule is detecting non-abstract test-classes which miss some required methods defined by one of the superclasses

Unimplemented methods lead to subclassResponsibility-failures.

Rule Properties:
- static analysis of the class
- fast
- high reliability

Smell Properties:
- severe
- not dangerous
"
Class {
	#name : #TLUnimplementedMethods,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'run private' }
TLUnimplementedMethods >> basicRun [

	| classes unimplementedMethods |
	classes := self node allSubclasses.
	unimplementedMethods := Set new.
	
	(self node methodNodes select: [ :each | each sentMessages includes: #subclassResponsibility ]) do: [ :m |
		classes do: [ :c | c isAbstract 
			ifFalse: [ (c methodNodes detect: [ :sm | sm selector = m selector ] ifNone: [ nil ])
					ifNil: [ unimplementedMethods add: (m -> c) ] ] ] ].

	^ unimplementedMethods
]

{ #category : #testing }
TLUnimplementedMethods >> isSmell: aCollection [
	^ aCollection isEmpty not
]
