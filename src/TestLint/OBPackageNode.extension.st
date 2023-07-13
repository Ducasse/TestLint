Extension { #name : #OBPackageNode }

{ #category : #'*TestLint' }
OBPackageNode >> asTLNode [
	^ TLPackageNode on: self packageInfo
]
