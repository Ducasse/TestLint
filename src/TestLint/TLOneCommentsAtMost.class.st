"
This rule is detecting test-methods which define more than one comment.

Tests are supposed to act as documentation. Documenting the documentation is redundant. 
A test containing lot of comments seems to be complex and therefore badly designed. However in many cases such a test only reflects the complexity of the model. In this case the model should be refactored.

Rule Properties:
- static analysis of a test-class
- fast
- maximum reliability

Smell Properties:
- not severe
- maybe dangerous
"
Class {
	#name : #TLOneCommentsAtMost,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #defaults }
TLOneCommentsAtMost class >> maxComments [
	^ 1
]

{ #category : #'private run' }
TLOneCommentsAtMost >> basicRun [
	^ self parseTree: [ self node comments ]
]

{ #category : #testing }
TLOneCommentsAtMost >> isSmell: aCollection [
	^ aCollection size > self class maxComments
]
