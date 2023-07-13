Class {
	#name : #TLPackageNode,
	#superclass : #TLNode,
	#instVars : [
		'packageInfo'
	],
	#category : #TestLint
}

{ #category : #'instance creation' }
TLPackageNode class >> on: aPackageInfo [
	^ super new initialize
		packageInfo: aPackageInfo;
		yourself
]

{ #category : #testing }
TLPackageNode >> = aTLPackage [
	^ super = aTLPackage 
		and: [ aTLPackage packageInfo = self packageInfo ]
]

{ #category : #converting }
TLPackageNode >> asNode [
	^ OBPackageNode onPackage: self packageInfo
]

{ #category : #accessing }
TLPackageNode >> classCategoryNodes [
	^ self packageInfo systemCategories collect: [ :each | TLClassCategoryNode new classCategory: each; yourself ]
]

{ #category : #accessing }
TLPackageNode >> classNodes [
	^ self classCategoryNodes gather: [ :node | node classNodes ]
]

{ #category : #'run dispatches' }
TLPackageNode >> dispatchClassCategoryRule: aRule [
	^ aRule basicDispatch: self classCategoryNodes
]

{ #category : #'run dispatches' }
TLPackageNode >> dispatchPackageRule: aRule [
	^ aRule basicDispatch: self
]

{ #category : #'run dispatches' }
TLPackageNode >> dispatchRule: aRuleClass [
	^ aRuleClass dispatchPackage: self
]

{ #category : #testing }
TLPackageNode >> hash [
	^ self packageInfo hash
]

{ #category : #testing }
TLPackageNode >> isPackageNode [
	^ true
]

{ #category : #testing }
TLPackageNode >> isTesting [
	^ (self classCategoryNodes detect: [ :each | each isTesting ] ifNone: [ nil ]) isNil not
]

{ #category : #accessing }
TLPackageNode >> methodCategoryNodes [
	^ (self classNodes gather: [ :each | each methodCategoryNodes ]),
		(self packageInfo extensionCategories asArray
			collect: [ :each | TLMethodCategoryNode on: each value in: each key ])
]

{ #category : #accessing }
TLPackageNode >> methodNodes [
	^ (self classNodes gather: [ :node | node methodNodes ]),
		(self packageInfo extensionMethods collect: [ :each | each asTLNode ])
]

{ #category : #accessing }
TLPackageNode >> packageInfo [
	^ packageInfo
]

{ #category : #accessing }
TLPackageNode >> packageInfo: aPackageInfo [
	packageInfo := aPackageInfo
	
]

{ #category : #accessing }
TLPackageNode >> packageName [
	^ self packageInfo packageName
]

{ #category : #accessing }
TLPackageNode >> packageNode [
	^ self
]
