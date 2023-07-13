Class {
	#name : #TLMethodCategoryNode,
	#superclass : #TLClassAwareNode,
	#instVars : [
		'methodCategory'
	],
	#category : #TestLint
}

{ #category : #'instance creation' }
TLMethodCategoryNode class >> on: aCategory in: aClass [
	^ (super on: aClass)
		methodCategory: aCategory;
		yourself
]

{ #category : #testing }
TLMethodCategoryNode >> = aMethodCategoryNode [
	^ (super = aMethodCategoryNode) 
		and: [ self methodCategory = aMethodCategoryNode methodCategory ]
]

{ #category : #converting }
TLMethodCategoryNode >> asNode [
	^ OBMethodCategoryNode on: self methodCategory inClass: self actualClass
]

{ #category : #'run dispatched' }
TLMethodCategoryNode >> dispatchMethodCategoryRule: aRule [
	^ aRule basicDispatch: self
]

{ #category : #'run dispatched' }
TLMethodCategoryNode >> dispatchRule: aRuleClass [
	^ aRuleClass dispatchMethodCategory: self
]

{ #category : #testing }
TLMethodCategoryNode >> hash [
	^ super hash bitXor: self methodCategory hash
]

{ #category : #testing }
TLMethodCategoryNode >> isDefault [
	^ self methodCategory matchesAny: #('no messages' 'as yet unclassified' '-- all --')
]

{ #category : #testing }
TLMethodCategoryNode >> isEmpty [
	^ self methodNodes isEmpty
]

{ #category : #testing }
TLMethodCategoryNode >> isExtension [
	" quick and dirty "
	^ self methodCategory first = $*
]

{ #category : #testing }
TLMethodCategoryNode >> isMethodCategoryNode [
	^ true
]

{ #category : #testing }
TLMethodCategoryNode >> isTesting [
	^ super isTesting and: [ (self methodNodes detect: [ :each | each isTesting ] ifNone: [ nil ]) isNil not ]
]

{ #category : #accessing }
TLMethodCategoryNode >> methodCategory [
	^ methodCategory
]

{ #category : #accessing }
TLMethodCategoryNode >> methodCategory: aCategory [
	methodCategory := aCategory
]

{ #category : #accessing }
TLMethodCategoryNode >> methodNodes [
	^ (self actualClass organization listAtCategoryNamed: self methodCategory)
		collect: [ :each | TLMethodNode new actualClass: self actualClass; selector: each; yourself ]
]

{ #category : #accessing }
TLMethodCategoryNode >> packageInfo [
	^ self packageOrganizer packageOfMethodCategory: self methodCategory in: self actualClass
]
