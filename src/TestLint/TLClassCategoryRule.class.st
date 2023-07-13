Class {
	#name : #TLClassCategoryRule,
	#superclass : #TLRule,
	#category : #TestLint
}

{ #category : #private }
TLClassCategoryRule class >> dispatchSelector [
	^ #dispatchClassCategoryRule:
]

{ #category : #testing }
TLClassCategoryRule class >> isAbstract [
	^ self == TLClassCategoryRule
]

{ #category : #run }
TLClassCategoryRule >> browse: aCollection [
	self browser browseClassCategories: aCollection
]
