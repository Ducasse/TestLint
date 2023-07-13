Class {
	#name : #TLMethodCategoryRule,
	#superclass : #TLRule,
	#category : #TestLint
}

{ #category : #private }
TLMethodCategoryRule class >> basicShouldDispatch: aNode [
	^ aNode isTesting
]

{ #category : #private }
TLMethodCategoryRule class >> dispatchSelector [
	^ #dispatchMethodCategoryRule:
]

{ #category : #testing }
TLMethodCategoryRule class >> isAbstract [
	^ self == TLMethodCategoryRule
]

{ #category : #private }
TLMethodCategoryRule class >> shouldDispatch: aNode [
	^ aNode isTesting
]

{ #category : #run }
TLMethodCategoryRule >> browse: aCollection [
	self browser browseMethodCategories: aCollection
]
