Class {
	#name : #MethodReference,
	#superclass : #Object,
	#category : #'TestLint-Browser'
}

{ #category : #'*TestLint' }
MethodReference >> asTLNode [
	^ TLMethodNode on: self
]
