"
This rule is detecting test-classes whose name do not conform to the standard testing conventions

Rule Properties:
- static analysis of the class
- fast
- high reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLClassName,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Organization'
}

{ #category : #defaults }
TLClassName class >> namePatterns [
	^ #( 'Test*' '*Test' 'Tests*' '*Tests' )
]

{ #category : #'private run' }
TLClassName >> basicRun [
	^ self node name matchesAny: self class namePatterns
]

{ #category : #testing }
TLClassName >> isSmell: aBoolean [
	^ aBoolean not
]
