Class {
	#name : #TLEnvironment,
	#superclass : #Object,
	#instVars : [
		'nodes'
	],
	#category : #TestLint
}

{ #category : #'instance creation' }
TLEnvironment class >> with: aTLNode [
	^ self new initializeWith: aTLNode; yourself
]

{ #category : #'instance creation' }
TLEnvironment class >> withAll: aCollection [
	^ self new initializeWithAll: aCollection; yourself
]

{ #category : #initializing }
TLEnvironment >> initialize [
	super initialize.
	nodes := Set new
]

{ #category : #initializing }
TLEnvironment >> initializeWith: aTLNode [
	nodes addAll: (Array with: aTLNode packageNode),
		(aTLNode classCategoryNodes),
		(aTLNode classNodes),
		(aTLNode methodCategoryNodes),
		(aTLNode methodNodes)
]

{ #category : #initializing }
TLEnvironment >> initializeWithAll: aCollection [
	aCollection do: [ :each | self initializeWith: each ]
]

{ #category : #private }
TLEnvironment >> nodes [
	^ nodes
]

{ #category : #private }
TLEnvironment >> remove: aTLNode [
	self nodes remove: aTLNode ifAbsent: [ ]
]

{ #category : #confuguration }
TLEnvironment >> removeAll [
	nodes := #()
]

{ #category : #confuguration }
TLEnvironment >> removeClass: aClass [
	self remove: aClass asTLNode
]

{ #category : #confuguration }
TLEnvironment >> removeClassBy: aBlock [
	self nodes 
		select: [ :each | each isClassNode and: [ aBlock value: each ] ]
		thenDo: [ :each | self remove: each ]
]

{ #category : #confuguration }
TLEnvironment >> removeClassesMatching: aString [
	self nodes 
		select: [ :each | each isClassNode and: [ aString match: each actualClass name ] ]
		thenDo: [ :each | self remove: each ]
]

{ #category : #confuguration }
TLEnvironment >> removeSelector: aSelector [
	self nodes 
		select: [ :each | each isMethodNode and: [ each selector = aSelector ] ]
		thenDo: [ :each | self remove: each ]
]

{ #category : #confuguration }
TLEnvironment >> removeSelectorsMatching: aString [
	self nodes 
		select: [ :each | each isMethodNode and: [ aString match: each selector ] ]
		thenDo: [ :each | self remove: each ]
]
