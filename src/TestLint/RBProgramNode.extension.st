Extension { #name : #RBProgramNode }

{ #category : #'*TestLint' }
RBProgramNode >> canReturn [
	^ self isReturn
		or: [ (self children detect: [:each | each canReturn ] ifNone: [ nil ]) isNil not ]
]

{ #category : #'*TestLint' }
RBProgramNode >> isAssertion [
	^ false
]

{ #category : #'*TestLint' }
RBProgramNode >> isBranch [
	^ (self sentMessages 
		detect: [ :each | SystemLogics uniqueInstance isBranchMessage: each ]
		ifNone: [ nil ]) isNil not
]

{ #category : #'*TestLint' }
RBProgramNode >> isReturn [
	^false
]

{ #category : #'*TestLint' }
RBProgramNode >> literals [
	| children |
	children := self children.
	children isEmpty ifTrue: [^#()].
	^ children inject: OrderedCollection new
		into: [ :vars :each | vars addAll: each literals; yourself]

]
