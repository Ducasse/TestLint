Class {
	#name : #TLClassNode,
	#superclass : #TLClassAwareNode,
	#category : #TestLint
}

{ #category : #accessing }
TLClassNode >> allSubclasses [
	^ self actualClass allSubclasses collect: [ :each | each asTLNode ]
]

{ #category : #converting }
TLClassNode >> asNode [
	^ OBClassNode on: self actualClass
]

{ #category : #accessing }
TLClassNode >> classCategoryNode [
	^ TLClassCategoryNode on: self actualClass category
]

{ #category : #accessing }
TLClassNode >> classNode [
	^ self
]

{ #category : #accessing }
TLClassNode >> configMethodNodes [
	^ self methodNodes 
		select: [ :each | self testingEnvironment acceptFixtureMethod: each reference ]
	
]

{ #category : #'run dispatched' }
TLClassNode >> dispatchClassRule: aRule [
	^ aRule basicDispatch: self
]

{ #category : #'run dispatched' }
TLClassNode >> dispatchRule: aRuleClass [
	^ aRuleClass dispatchClass: self
]

{ #category : #testing }
TLClassNode >> isAbstract [
	^ self actualClass isAbstract
]

{ #category : #testing }
TLClassNode >> isClassNode [
	^ true
]

{ #category : #accessing }
TLClassNode >> methodCategoryNodes [
	^ self actualClass organization categories 
		collect: [ :each | TLMethodCategoryNode new actualClass: self actualClass; methodCategory: each; yourself ]
]

{ #category : #accessing }
TLClassNode >> methodNodes [
	^ self actualClass selectors 
		collect: [ :each | TLMethodNode new actualClass: self actualClass; selector: each; yourself ]
]

{ #category : #accessing }
TLClassNode >> name [
	^ self actualClass name
]

{ #category : #accessing }
TLClassNode >> superClassNode [
	^ self actualClass superclass asTLNode
]

{ #category : #accessing }
TLClassNode >> withAllSubclasses [
	^ self actualClass withAllSubclasses collect: [ :each | each asTLNode ]
]
