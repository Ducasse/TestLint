Class {
	#name : #TLPartialState,
	#superclass : #TLUnexpectedErrorState,
	#category : #TestLint
}

{ #category : #testing }
TLPartialState >> canSmell [
	self isIgnored ifTrue: [ ^ false ].
	^ true
]
