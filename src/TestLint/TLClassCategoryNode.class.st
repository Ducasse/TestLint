Class {
	#name : #TLClassCategoryNode,
	#superclass : #TLNode,
	#instVars : [
		'classCategory'
	],
	#category : #TestLint
}

{ #category : #'instance creation' }
TLClassCategoryNode class >> on: aClassCategory [
	^ super new initialize
		classCategory: aClassCategory;
		yourself
]

{ #category : #testing }
TLClassCategoryNode >> = aTLClassCategory [
	^ super = aTLClassCategory and: [ self classCategory match: aTLClassCategory classCategory ]
]

{ #category : #accessing }
TLClassCategoryNode >> classCategory [
	^ classCategory
]

{ #category : #accessing }
TLClassCategoryNode >> classCategory: aCategory [
	classCategory := aCategory
]

{ #category : #accessing }
TLClassCategoryNode >> classCategoryNode [
	^ self
]

{ #category : #accessing }
TLClassCategoryNode >> classNodes [
	^ (Smalltalk organization listAtCategoryNamed: self classCategory)
		collect: [ :each | TLClassNode new actualClass: (Smalltalk at: each); yourself ]
]

{ #category : #'run dispatches' }
TLClassCategoryNode >> dispatchClassCategoryRule: aRule [
	^ aRule basicDispatch: self
]

{ #category : #'run dispatches' }
TLClassCategoryNode >> dispatchRule: aRuleClass [
	^ aRuleClass dispatchClassCategory: self
]

{ #category : #testing }
TLClassCategoryNode >> hash [
	^ self classCategory hash
]

{ #category : #testing }
TLClassCategoryNode >> isClassCategoryNode [
	^  true
]

{ #category : #testing }
TLClassCategoryNode >> isTesting [
	^ (self classNodes detect: [ :each | each isTesting ] ifNone: [ nil ]) isNil not
]

{ #category : #accessing }
TLClassCategoryNode >> methodCategoryNodes [
	^ self classNodes gather: [ :each | each methodCategoryNodes ]
]

{ #category : #accessing }
TLClassCategoryNode >> methodNodes [
	^ self classNodes gather: [ :node | node methodNodes ]
]

{ #category : #accessing }
TLClassCategoryNode >> packageNode [
	^ (PackageOrganizer default packageOfClassCategory: self classCategory) asTLNode
]
