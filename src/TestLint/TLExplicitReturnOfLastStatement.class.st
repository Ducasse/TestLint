"
This rule is detecting test-methods which return the value of the last statement.

Returning the last statement is rather unusual for unit testing - but not forbidden.

Rule Properties:
- static analysis on the parse-tree
- fast
- maximum reliability

Smell Properties:
- not severe
- not dangerous

"
Class {
	#name : #TLExplicitReturnOfLastStatement,
	#superclass : #TLReturningTest,
	#category : #'TestLint-Rules-Method'
}

{ #category : #'private run' }
TLExplicitReturnOfLastStatement >> basicRun [
	^ self parseTree: [ self node statements last ]
]

{ #category : #testing }
TLExplicitReturnOfLastStatement >> isSmell: aStatement [
	^ aStatement canReturn
]
