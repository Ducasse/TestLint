"
This rule is detecing test-classes which are completely empty - no instance-based or class-based methods

A completely empty test-class is useless.

Rule Properties:
- static analysis of the test-class
- fast
- high reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLTotallyEmptyTestClass,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'run private' }
TLTotallyEmptyTestClass >> basicRun [
	^ Array with: self node methodNodes with: self node metaClassNode methodNodes
]

{ #category : #testing }
TLTotallyEmptyTestClass >> isSmell: aCollectionOfMethods [
	^ aCollectionOfMethods first isEmpty and: [ aCollectionOfMethods last isEmpty ]
]
