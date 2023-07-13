Class {
	#name : #TLClassAwareNode,
	#superclass : #TLNode,
	#instVars : [
		'actualClass'
	],
	#category : #TestLint
}

{ #category : #testing }
TLClassAwareNode class >> isAbstract [
	^ self == TLClassAwareNode
]

{ #category : #'instance creation' }
TLClassAwareNode class >> on: aClass [
	^ super new initialize
		actualClass: aClass;
		yourself
]

{ #category : #testing }
TLClassAwareNode >> = aTLNode [
	^ super = aTLNode and: [ self actualClass = aTLNode actualClass ]
]

{ #category : #accessing }
TLClassAwareNode >> actualClass [
	^ actualClass
]

{ #category : #accessing }
TLClassAwareNode >> actualClass: aClass [
	actualClass := aClass
]

{ #category : #converting }
TLClassAwareNode >> asNode [
	^ OBClassCategoryNode on: self classCategory
]

{ #category : #accessing }
TLClassAwareNode >> classCategoryNode [
	^ self classNode classCategoryNode
]

{ #category : #accessing }
TLClassAwareNode >> classNode [
	^ self actualClass asTLNode
]

{ #category : #accessing }
TLClassAwareNode >> classNodes [
	^ Array with: (self classNode)
]

{ #category : #'run dispatched' }
TLClassAwareNode >> dispatchClassCategoryRule: aRule [
	^ aRule basicDispatch: self classCategoryNode
]

{ #category : #'run dispatched' }
TLClassAwareNode >> dispatchClassRule: aRule [
	^ aRule basicDispatch: self classNode
]

{ #category : #'run dispatched' }
TLClassAwareNode >> dispatchPackageRule: aRule [
	^ aRule basicDispatch: self packageNode
]

{ #category : #testing }
TLClassAwareNode >> hash [
	^ self actualClass hash
]

{ #category : #testing }
TLClassAwareNode >> isTesting [
	^ self testingEnvironment acceptClass: self actualClass
]

{ #category : #accessing }
TLClassAwareNode >> metaClassNode [
	^ self actualClass theMetaClass asTLNode
]

{ #category : #accessing }
TLClassAwareNode >> packageInfo [
	^ self packageOrganizer packageOfClass: self actualClass
]

{ #category : #accessing }
TLClassAwareNode >> packageNode [
	^ TLPackageNode new packageInfo: self packageInfo; yourself
]
