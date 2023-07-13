"
This rule is detecting test-methods which explicitely call one of their fixture methods.

An explicit call of a fixture method is rather unusual in unit-testing, especially in sunit providing a shared fixture. However explicit fixtures might be necessary in some cases. An explicit fixture call is slowing down the runtime as the shared fixture is also executed.

Rule Properties:
- static analysis of a test-class
- fast
- maximum reliability

Smell Properties:
- not severe
- maybe dangerous
"
Class {
	#name : #TLExplicitFixtureCall,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'private run' }
TLExplicitFixtureCall >> basicRun [
	^ self node sentMessages select: [ :msg | msg matchesAny: self fixtureSelectors ]
]

{ #category : #'private run' }
TLExplicitFixtureCall >> fixtureSelectors [
	^ self testingEnvironment allFixtureSelectors
]

{ #category : #testing }
TLExplicitFixtureCall >> isSmell: aCollection [
	^ aCollection isEmpty not
]
