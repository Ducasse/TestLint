Class {
	#name : #SystemAssertions,
	#superclass : #TSSystemRegistrySingleton,
	#instVars : [
		'assertions',
		'testclasses'
	],
	#category : #'TestLint-Environment'
}

{ #category : #accessing }
SystemAssertions class >> allAssertions [
	^ self uniqueInstance allAssertions
]

{ #category : #accessing }
SystemAssertions >> allAssertions [
	assertions isNil 
		ifTrue: [ assertions := self assertions ].
	^ assertions
]

{ #category : #private }
SystemAssertions >> assertions [
	testclasses := nil.
	^ (self deepSendersOf: self primitiveAssertions processed: Set new)
		collect: [ :each | each selector ]
]

{ #category : #'system notifications' }
SystemAssertions >> basicUpdate: aCompiledMethod [
	self testingEnvironment
		framework: [ :f | (f acceptClass: aCompiledMethod actualClass)
							and: [ (f acceptSelector: aCompiledMethod selector 
										inClass: aCompiledMethod actualClass) not ] ]
		do: [ :f | (aCompiledMethod messages includesAnyOf: self allAssertions)
				ifTrue: [ self allAssertions add: aCompiledMethod selector ] ]
	
]

{ #category : #private }
SystemAssertions >> deepSendersOf: aCollectionOfMethodReferences processed: aCollection [
	| nextSenders diffSenders |
	aCollectionOfMethodReferences ifEmpty: [ ^ aCollection ].
	nextSenders := self filter: (self sendersOf: aCollectionOfMethodReferences).
	diffSenders := nextSenders difference: aCollection.
	aCollection addAll: aCollectionOfMethodReferences.
	^ self deepSendersOf: diffSenders processed: aCollection
]

{ #category : #private }
SystemAssertions >> filter: aCollectionOfMethodReferences [
	^ aCollectionOfMethodReferences 
		reject: [ :each | (self testingEnvironment 
			framework: [ :f | f acceptMethod: each ]) isNil not ]
]

{ #category : #testing }
SystemAssertions >> isAssertion: aSelector [
	^ self allAssertions includes: aSelector
]

{ #category : #'system notifications' }
SystemAssertions >> methodModified: anEvent [
	[ self update: anEvent item ] fork

]

{ #category : #'system notifications' }
SystemAssertions >> methodRemoved: anEvent [
	self allAssertions remove: anEvent item selector ifAbsent: []
]

{ #category : #private }
SystemAssertions >> primitiveAssertions [
	^ self testingEnvironment allPrimitiveAssertions
]

{ #category : #'system notifications' }
SystemAssertions >> register [
	SystemChangeNotifier uniqueInstance 
		notify: self ofSystemChangesOfItem: #method change: #Added using: #methodModified: ;
		notify: self ofSystemChangesOfItem: #method change: #Modified using: #methodModified: ;
		notify: self ofSystemChangesOfItem: #method change: #Removed using: #methodRemoved:
]

{ #category : #private }
SystemAssertions >> sendersOf: aCollectionOfMethodReferences [
	| result |
	result := Set new.
	aCollectionOfMethodReferences do: [ :each |
		result addAll: (SystemNavigation default 
			allMethodReferencesFrom: self testClasses sending: each selector) ].
	^ result
]

{ #category : #private }
SystemAssertions >> testClasses [
	^ testclasses ifNil: [ testclasses := self testingEnvironment allTestClasses ]
]

{ #category : #'system notifications' }
SystemAssertions >> update: aCompiledMethod [
	[ self basicUpdate: aCompiledMethod ] on: Error do: [ assertions := nil ]
]
