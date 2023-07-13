Class {
	#name : #TLParseErrorState,
	#superclass : #TLState,
	#category : #TestLint
}

{ #category : #testing }
TLParseErrorState >> isError [
	^ true
]

{ #category : #testing }
TLParseErrorState >> isExpected [
	^ false
]

{ #category : #testing }
TLParseErrorState >> isIgnored [
	^ false
]
