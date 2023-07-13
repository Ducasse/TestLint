Class {
	#name : #TLMethodRule,
	#superclass : #TLRule,
	#category : #TestLint
}

{ #category : #testing }
TLMethodRule class >> basicShouldDispatch: aMethodNode [
	^ aMethodNode isTesting
]

{ #category : #private }
TLMethodRule class >> dispatchSelector [
	^ #dispatchMethodRule:
]

{ #category : #testing }
TLMethodRule class >> isAbstract [
	^ self == TLMethodRule
]

{ #category : #testing }
TLMethodRule class >> shouldDispatch: aNode [
	^ aNode isTesting
]

{ #category : #run }
TLMethodRule >> browse: aCollection [
	self browser browseMethods: aCollection
]

{ #category : #testing }
TLMethodRule >> shouldIgnore [
	^ self node hasPragma: #ignore for: self class
]
