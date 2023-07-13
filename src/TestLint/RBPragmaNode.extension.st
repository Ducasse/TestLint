Extension { #name : #RBPragmaNode }

{ #category : #'*TestLint' }
RBPragmaNode >> isExclusionFor: aRule [
	^ self pragma isExclusionFor: aRule
]
