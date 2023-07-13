Class {
	#name : #TestLint,
	#superclass : #Object,
	#category : #'TestLint-Environment'
}

{ #category : #initializing }
TestLint class >> initialize [
	super initialize.
	self install.
]

{ #category : #'install / uninstall' }
TestLint class >> install [
	self makeSelectors
		do: [ :each | self perform: each ]
		displayingProgress: 'Initializing TestLint Environment ...'
]

{ #category : #private }
TestLint class >> makeAssertions [
	SystemAssertions reset; allAssertions
]

{ #category : #private }
TestLint class >> makeLogics [
	SystemLogics uniqueInstance allEnumerations
]

{ #category : #private }
TestLint class >> makeParseTrees [
	SmalltalkTesting default allTestClasses 
		do: [ :cl | cl methodsDo: [ :cm | TLParseTreeService annotation: cm ] ]
		displayingProgress: 'Generating Parse-Tree Annotations'
]

{ #category : #'install / uninstall' }
TestLint class >> makeSelectors [
	^ self class selectors select: [ :each | 'make*' match: each ]
]

{ #category : #private }
TestLint class >> makeSystemCache [
	SystemTestSmells reset; uniqueInstance
]

{ #category : #'install / uninstall' }
TestLint class >> uninstall [
	self unmakeSelectors
		do: [ :each | self perform: each ]
		displayingProgress: 'Removing TestLint Environment from Image ...'
]

{ #category : #initializing }
TestLint class >> unload [
	self uninstall.
	super unload
]

{ #category : #private }
TestLint class >> unmakeAssertions [
	SystemAssertions reset
]

{ #category : #private }
TestLint class >> unmakeLogics [
	SystemLogics reset
]

{ #category : #private }
TestLint class >> unmakeParseTrees [
	Smalltalk allClasses 
		do: [ :cl | cl methodsDo: [ :cm | TSParseTreeService removeAnnotation: cm ] ]
		displayingProgress: 'Removing Parse-Tree Annotations'
]

{ #category : #'install / uninstall' }
TestLint class >> unmakeSelectors [
	^ self class selectors select: [ :each | 'unmake*' match: each ]
]

{ #category : #private }
TestLint class >> unmakeSystemCache [
	SystemTestSmells reset
]

{ #category : #private }
TestLint class >> unmakeTestLint [
	SmalltalkImage current fixObsoleteReferences.
	Behavior flushObsoleteSubclasses.
	Object removeAllObsoleteSubclasses.
	Smalltalk garbageCollectMost.
	Smalltalk garbageCollect.
]
