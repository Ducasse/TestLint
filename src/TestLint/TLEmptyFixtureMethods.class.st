"
This rule is detecting test-classes which have empty shared fixture methods

An empty shared fixture is obsolete and should be removed - or filled with something useful.

Rule Properties:
- static analysis of the class
- fast
- high reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLEmptyFixtureMethods,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'private run' }
TLEmptyFixtureMethods >> basicRun [
	^ self fixtureMethods 
		select: [ :each | (self parseTree: [ each statements ]) 
			ifNotNilDo: [ :col | col isEmpty ] ifNil: [ false ] ]
]

{ #category : #'private run' }
TLEmptyFixtureMethods >> fixtureMethods [
	^ (self testingEnvironment framework: [ :f | f acceptClass: self node actualClass ]) defaultFixtures
		collect: [ :each | TLMethodNode on: each in: self node actualClass ]
]

{ #category : #testing }
TLEmptyFixtureMethods >> isSmell: aValue [
	^ aValue isEmpty not
]
