Class {
	#name : #TLMethodAnnotationService,
	#superclass : #TLService,
	#category : #'TestLint-Environment'
}

{ #category : #annotating }
TLMethodAnnotationService class >> annotate: aCompiledMethod with: aBlock [
	^ self annotator 
		annotate: aCompiledMethod 
		withKey: self name
		withValue: (aBlock on: Error do: [ nil ])

]

{ #category : #accessing }
TLMethodAnnotationService class >> annotation: aCompiledMethod [
	^ self annotator
		annotation: self name
		on: aCompiledMethod
		ifAbsent: [ self new method: aCompiledMethod ]
]

{ #category : #accessing }
TLMethodAnnotationService class >> annotator [
	^ TLAnnotator
]

{ #category : #annotating }
TLMethodAnnotationService class >> removeAnnotation: aCompiledMethod [
	^ self annotator
		removeAnnotation: self name
		from: aCompiledMethod
]

{ #category : #annotating }
TLMethodAnnotationService >> annotate: aCompiledMethod with: aBlock [
	^ self class 
		annotate: aCompiledMethod 
		with: aBlock
]

{ #category : #annotating }
TLMethodAnnotationService >> annotationBlockFor: aCompiledMethod [
	^ self subclassResponsibility
]

{ #category : #'event actions' }
TLMethodAnnotationService >> basicEvent: anEvent [
	self subclassResponsibility
]

{ #category : #'event actions' }
TLMethodAnnotationService >> event: anEvent [
	anEvent itemKind = #method ifTrue: [ self basicEvent: anEvent ]
]
