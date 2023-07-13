Class {
	#name : #TLClassRule,
	#superclass : #TLRule,
	#category : #TestLint
}

{ #category : #testing }
TLClassRule class >> basicShouldDispatch: aClassNode [
	^ aClassNode isTesting
]

{ #category : #private }
TLClassRule class >> dispatchSelector [
	^ #dispatchClassRule:
]

{ #category : #testing }
TLClassRule class >> isAbstract [
	^ self == TLClassRule
]

{ #category : #testing }
TLClassRule class >> shouldDispatch: aNode [
	^ aNode isTesting
]

{ #category : #run }
TLClassRule >> browse: aCollection [
	self browser browseClasses: aCollection
]
