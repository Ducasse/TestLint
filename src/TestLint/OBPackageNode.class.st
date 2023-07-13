Class {
	#name : #OBPackageNode,
	#superclass : #Object,
	#category : #'TestLint-Browser'
}

{ #category : #'*TestLint' }
OBPackageNode >> asTLNode [
	^ TLPackageNode on: self packageInfo
]
