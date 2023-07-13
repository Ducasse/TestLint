Class {
	#name : #TLIgnoredState,
	#superclass : #TLState,
	#category : #TestLint
}

{ #category : #testing }
TLIgnoredState >> isExpected [
	^ true
]

{ #category : #testing }
TLIgnoredState >> isIgnored [
	^ true
]
