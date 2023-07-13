Extension { #name : #CompiledMethod }

{ #category : #'*TestLint' }
CompiledMethod >> actualClass [
	^ self methodClass
]

{ #category : #'*TestLint' }
CompiledMethod >> allMessages [
	| scanner aSet |
	aSet  :=  OrderedCollection new.
	scanner  :=  InstructionStream on: self.
	scanner	
		scanFor: 
			[:x | 
			scanner addSelectorTo: aSet.
			false	"keep scanning"].
	^aSet
]

{ #category : #'*TestLint' }
CompiledMethod >> asTLNode [
	^ self asNode asTLNode
]

{ #category : #'*TestLint' }
CompiledMethod >> reference [
	^ MethodReference class: self actualClass selector: self selector
]
