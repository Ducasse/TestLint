Class {
	#name : #TLAnalysedState,
	#superclass : #TLState,
	#category : #TestLint
}

{ #category : #testing }
TLAnalysedState >> canSmell [
	self isError ifTrue: [ ^ false ].
	self isIgnored ifTrue: [ ^ false ].
	^ true
]

{ #category : #testing }
TLAnalysedState >> isError [
	^ false
]

{ #category : #testing }
TLAnalysedState >> isExpected [
	^ true
]

{ #category : #testing }
TLAnalysedState >> isIgnored [
	^ false
]
