"
This rule is detecting test-methods which might return at the first statement.

A guarding test is dangerous because it is likely to drop the entire test, pretending a good test result although no code or assertion has been executed.

Rule Properties:
- static analysis on the parse-tree
- fast
- maximum reliability

Smell Properties:
- severe
- dangerous
"
Class {
	#name : #TLGuardedTest,
	#superclass : #TLReturningTest,
	#category : #'TestLint-Rules-Method'
}

{ #category : #'private run ' }
TLGuardedTest >> basicRun [
	
	^ self parseTree: [ self node statements first ]
]

{ #category : #testing }
TLGuardedTest >> isSmell: aStatement [
	^ aStatement canReturn
]
