Class {
	#name : #TLGuardedAssertions,
	#superclass : #TLMethodRule,
	#category : #'TestLint-TO-BE-FIXED'
}

{ #category : #'private run' }
TLGuardedAssertions >> basicRun [
	^ self parseTree: [ self node statements select: [ :s | s isAssertion and: [ s isBranch ] ] ]
]

{ #category : #testing }
TLGuardedAssertions >> isSmell: aCollectionOfGuardedAssertions [
	^ aCollectionOfGuardedAssertions isEmpty not
]
