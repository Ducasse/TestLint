Extension { #name : #RBAssignmentNode }

{ #category : #'*TestLint' }
RBAssignmentNode >> isAssertion [
	^ self value isAssertion
]
