"
This rule is detecting test-methods which consist only of comments

Tests consisting only of comments are evidence for:
- buggy or quickly changing model code
- unstable behavior
- slow tests
- manual, obsolete or abandonned  tests
- pretending test (pass only)

Smell Properties:
- static analysis on the parse-tree
- fast
- maximum reliability

Smell:
- severe
- dangerous
"
Class {
	#name : #TLCommentsOnlyTest,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #'run private' }
TLCommentsOnlyTest >> basicRun [
	^ self parseTree: [ (self node statements) -> (self node comments) ] 
]

{ #category : #testing }
TLCommentsOnlyTest >> isSmell: anAssociation [
	^ anAssociation value isEmpty
		ifTrue: [ false ] 
		ifFalse: [ anAssociation key isEmpty ]
]
