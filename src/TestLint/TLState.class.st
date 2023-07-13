Class {
	#name : #TLState,
	#superclass : #Object,
	#category : #TestLint
}

{ #category : #translations }
TLState >> analysed [
	^ self class == TLState ifTrue: [ TLAnalysedState new ] ifFalse: [ self ]
]

{ #category : #testing }
TLState >> canSmell [
	self isError ifTrue: [ ^ false ].
	self isIgnored ifTrue: [ ^ false ].
	self isExpected ifTrue: [ ^ false ].
	^ true
]

{ #category : #translations }
TLState >> default [
	^ TLState new
]

{ #category : #translations }
TLState >> ignored [
	^ TLIgnoredState new
]

{ #category : #testing }
TLState >> isAnalysed [
	^ self class == TLState ifTrue: [ false ] ifFalse: [ self ignored not ]
]

{ #category : #testing }
TLState >> isError [
	^ false
]

{ #category : #testing }
TLState >> isExpected [
	^ true
]

{ #category : #testing }
TLState >> isIgnored [
	^ false
]

{ #category : #translations }
TLState >> parseError [
	^ TLParseErrorState new
]

{ #category : #translations }
TLState >> parseTreeError [
	^ TLParseTreeErrorState new
]

{ #category : #translations }
TLState >> partial [
	^ TLPartialState new
]

{ #category : #translations }
TLState >> unexpectedError [
	^ TLUnexpectedErrorState new
]
