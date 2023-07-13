"
This rule is detecting test-classes whose test-suite is empty on a test-run (regardless whether the test defines test-methods or not)

An empty suite does not run any tests, but consumes computational effort for setting it up. It can slow down testing if the fixture is large. An empty suite might reveal a bad test-configuration (common problem in sunit <3.9).

Rule Properties:
- dynamic
- slow
- maximum reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLEmptyTestSuite,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'run private' }
TLEmptyTestSuite >> basicRun [
	^ self node suite
]

{ #category : #testing }
TLEmptyTestSuite >> isSmell: aSuite [
	^ aSuite isEmpty
]
