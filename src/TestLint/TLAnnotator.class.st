Class {
	#name : #TLAnnotator,
	#superclass : #Object,
	#category : #'TestLint-Environment'
}

{ #category : #annotating }
TLAnnotator class >> annotate: aCompiledMethod withKey: aKey withValue: aValue [
	aCompiledMethod properties at: aKey put: aValue.
	^ aValue
]

{ #category : #annotating }
TLAnnotator class >> annotation: aKey on: aCompiledMethod ifAbsent: aBlock [
	^ aCompiledMethod properties 
		at: aKey
		ifAbsent: aBlock
	
]

{ #category : #annotating }
TLAnnotator class >> removeAnnotation: aKey from: aCompiledMethod [
	^ aCompiledMethod properties removeKey: aKey ifAbsent: [ nil ]
]
