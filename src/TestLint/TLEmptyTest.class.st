"
This rule is detecting test-methods which are completely empty - no statements, no comments

A test-method which is completely empty is useless and pretending a good test-result althoug nothing is executed or asserted.

NOTE: comments on parse-tree often return no-comment although there is a comment

Rule Properties:
- static analysis on the parse-tree
- fast
- maximum reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLEmptyTest,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #'private run' }
TLEmptyTest >> basicRun [
	^ self parseTree: [ self node statements isEmpty and: [ self node comments isEmpty ] ] 
]

{ #category : #testing }
TLEmptyTest >> isSmell: aBoolean [
	^ aBoolean
]
