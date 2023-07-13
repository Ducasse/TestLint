Class {
	#name : #TLParseTreeService,
	#superclass : #TLMethodAnnotationService,
	#category : #'TestLint-Environment'
}

{ #category : #testing }
TLParseTreeService class >> isAbstract [
	^ false
]

{ #category : #'event actions' }
TLParseTreeService >> annotationBlockFor: aCompiledMethod [
	^ [ aCompiledMethod parseTree ]
]

{ #category : #'event actions' }
TLParseTreeService >> basicEvent: aMethodChangeEvent [
	self method: aMethodChangeEvent itemMethod
]

{ #category : #'event actions' }
TLParseTreeService >> method: aCompiledMethod [
	^ self annotate: aCompiledMethod with: (self annotationBlockFor: aCompiledMethod)
]
