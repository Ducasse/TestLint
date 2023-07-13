Class {
	#name : #TLNode,
	#superclass : #Object,
	#traits : 'TTLRunnable',
	#classTraits : 'TTLRunnable classTrait',
	#category : #TestLint
}

{ #category : #testing }
TLNode class >> isAbstract [
	^ self == TLNode
]

{ #category : #accessing }
TLNode class >> nodes [
	^ self packageOrganizer packages collect: [ :each | each asTLNode ]
]

{ #category : #testing }
TLNode >> = aTLNode [
	^ self class = aTLNode class
]

{ #category : #converting }
TLNode >> asNode [
	self subclassResponsibility
]

{ #category : #accessing }
TLNode >> classCategoryNodes [
	^ (Array with: self classCategoryNode)
]

{ #category : #'run dispatched' }
TLNode >> dispatchClassCategoryRule: aRule [
	^ aRule basicDispatch: self classCategoryNode
]

{ #category : #'run dispatched' }
TLNode >> dispatchClassRule: aRule [
	^ aRule basicDispatchCollection: self classNodes
]

{ #category : #'run dispatched' }
TLNode >> dispatchMethodCategoryRule: aRule [
	^ aRule basicDispatchCollection: self methodCategoryNodes
]

{ #category : #'run dispatched' }
TLNode >> dispatchMethodRule: aRule [
	^ aRule basicDispatchCollection: self methodNodes
]

{ #category : #'run dispatched' }
TLNode >> dispatchPackageRule: aRule [
	^ aRule basicDispatch: self packageNode
]

{ #category : #'run dispatched' }
TLNode >> dispatchRule: aRuleClass [
	^ self subclassResponsibility
]

{ #category : #testing }
TLNode >> expectSmell: aRuleClass [
	^ false
]

{ #category : #testing }
TLNode >> hash [
	^ self subclassResponsibility
]

{ #category : #testing }
TLNode >> isClassCategoryNode [
	^ false
]

{ #category : #testing }
TLNode >> isClassNode [
	^ false
]

{ #category : #testing }
TLNode >> isMethodCategoryNode [
	^ false
]

{ #category : #testing }
TLNode >> isMethodNode [
	^ false
]

{ #category : #testing }
TLNode >> isPackageNode [
	^ false
]

{ #category : #testing }
TLNode >> isTesting [
	^ (self methodNodes detect: [ :each | each isTesting ] ifNone: [ nil ]) isNil not
]

{ #category : #testing }
TLNode >> isTraitNode [
	^ false
]

{ #category : #accessing }
TLNode >> nonTestMethodNodes [
	^ self methodNodes difference: self testMethodNodes
]

{ #category : #accessing }
TLNode >> packageInfo [
	self subclassResponsibility
]

{ #category : #run }
TLNode >> run: aRuleClass [
	^ self runRules: (Array with: aRuleClass)
]

{ #category : #run }
TLNode >> runImage [
	^ self runRules: (self class rootRule rules)
]

{ #category : #run }
TLNode >> runRules: aCollectionOfRules [
	^ (TLRunner node: self rules: aCollectionOfRules) run
]

{ #category : #accessing }
TLNode >> suite [
	^ self asNode suite
]

{ #category : #accessing }
TLNode >> testMethodNodes [
	^ self methodNodes 
		select: [ :each | self testingEnvironment acceptMethod: each reference ]
	
]

{ #category : #accessing }
TLNode >> utilMethodNodes [
	^ self nonTestMethodNodes 
		reject: [ :each | self testingEnvironment acceptFixtureMethod: each reference ]
	
]
