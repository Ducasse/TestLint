Class {
	#name : #TLSystemSingleton,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'TestLint-Environment'
}

{ #category : #'instance creation' }
TLSystemSingleton class >> new [
	^ self shouldNotImplement
]

{ #category : #initialization }
TLSystemSingleton class >> reset [
	uniqueInstance isNil ifFalse: [ uniqueInstance := nil ].

]

{ #category : #accessing }
TLSystemSingleton class >> uniqueInstance [
	uniqueInstance isNil
		ifTrue: [ uniqueInstance := self basicNew initialize ].
	^ uniqueInstance 
]

{ #category : #initialization }
TLSystemSingleton class >> unload [
	self reset.
	super unload
]

{ #category : #private }
TLSystemSingleton >> testingEnvironment [
	^ SmalltalkTesting default
]
