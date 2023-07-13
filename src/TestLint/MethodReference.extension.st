Extension { #name : #MethodReference }

{ #category : #'*TestLint' }
MethodReference >> asTLNode [
	^ TLMethodNode on: self
]
