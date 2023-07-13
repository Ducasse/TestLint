Class {
	#name : #TLUnexpectedErrorState,
	#superclass : #TLAnalysedState,
	#category : #TestLint
}

{ #category : #testing }
TLUnexpectedErrorState >> isError [
	^ true
]

{ #category : #testing }
TLUnexpectedErrorState >> isExpected [
	^ false
]
