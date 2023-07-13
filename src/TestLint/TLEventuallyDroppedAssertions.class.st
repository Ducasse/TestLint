"
This rule is detecting test-methods which might return too early, dropping some of the defined assertions.

A returning test can lead to a test which passes although it doesn't execute all the necessary assertions or code. This can lead to pretending or guarding tests.

Rule Properties:
- static analysis on the parse-tree
- fast
- maximum reliability

Smell Properties:
- severe
- dangerous

"
Class {
	#name : #TLEventuallyDroppedAssertions,
	#superclass : #TLReturningTest,
	#category : #'TestLint-Rules-Method'
}

{ #category : #'private run ' }
TLEventuallyDroppedAssertions >> basicRun [
	| guardedAssertions |
	
	guardedAssertions := OrderedCollection new.
	
	self parseTree: [ (self node statements copyWithoutLast select: [ :each | each canReturn ]) ifNotEmptyDo: [ :col | 
		(self node statements copyFrom: (col last))
			do: [ :each | each isAssertion ifTrue: [ guardedAssertions add: each ] ] ] ].
		
	^ guardedAssertions
]

{ #category : #testing }
TLEventuallyDroppedAssertions >> isSmell: aCollectionOfReturningStatements [
	^ aCollectionOfReturningStatements isEmpty not
]
