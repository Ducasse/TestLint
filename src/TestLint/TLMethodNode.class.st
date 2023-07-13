Class {
	#name : #TLMethodNode,
	#superclass : #TLClassAwareNode,
	#instVars : [
		'selector'
	],
	#category : #TestLint
}

{ #category : #'instance creation' }
TLMethodNode class >> on: aMethodReference [
	^ (super on: aMethodReference actualClass)
		selector: aMethodReference selector;
		yourself
]

{ #category : #'instance creation' }
TLMethodNode class >> on: aSelector in: aClass [
	^ (super on: aClass)
		selector: aSelector;
		yourself
]

{ #category : #testing }
TLMethodNode >> = aMethodNode [
	^ super = aMethodNode and: [ self selector = aMethodNode selector ]
]

{ #category : #parsetree }
TLMethodNode >> allAssertions [
	^ self allSentMessages select: [ :each | self systemAssertions isAssertion: each ]
]

{ #category : #parsetree }
TLMethodNode >> allSentMessages [
	^ [ self compiledMethod allMessages ] on: Error do: [ #() ]
]

{ #category : #converting }
TLMethodNode >> asNode [
	^ OBMethodNode on: self reference
]

{ #category : #parsetree }
TLMethodNode >> assertions [
	^ self sentMessages select: [ :each | self systemAssertions isAssertion: each ]
]

{ #category : #parsetree }
TLMethodNode >> comments [
	^ self parseTree comments
]

{ #category : #accessing }
TLMethodNode >> compiledMethod [
	^ self reference compiledMethod
]

{ #category : #'run dispatched' }
TLMethodNode >> dispatchMethodCategoryRule: aRule [
	^ aRule basicDispatch: self methodCategoryNode
]

{ #category : #'run dispatched' }
TLMethodNode >> dispatchMethodRule: aRule [
	^ aRule basicDispatch: self
]

{ #category : #'run dispatched' }
TLMethodNode >> dispatchRule: aRuleClass [
	^ aRuleClass dispatchMethod: self

]

{ #category : #testing }
TLMethodNode >> expectSmell: aRuleClass [
	^ self hasPragma: #expected for: aRuleClass
]

{ #category : #testing }
TLMethodNode >> hasPragma: aSymbol for: aRuleClass [
	^ (self compiledMethod pragmas 
		detect: [ :each | each has: aSymbol for: aRuleClass ]
		ifNone: [ nil ]) isNil not
]

{ #category : #testing }
TLMethodNode >> hash [
	^ super hash bitXor: self selector hash
]

{ #category : #testing }
TLMethodNode >> isMethodNode [
	^ true
]

{ #category : #testing }
TLMethodNode >> isTesting [
	^ self testingEnvironment acceptMethod: self reference
]

{ #category : #parsetree }
TLMethodNode >> literals [
	^ self parseTree literals
]

{ #category : #accessing }
TLMethodNode >> methodCategoryNode [
	^ TLMethodCategoryNode new actualClass: self actualClass; methodCategory: (self actualClass organization categoryOfElement: self selector); yourself
]

{ #category : #accessing }
TLMethodNode >> methodNode [
	" reuability "
	^ #()
]

{ #category : #accessing }
TLMethodNode >> methodNodes [
	^ Array with: self
]

{ #category : #accessing }
TLMethodNode >> packageInfo [
	^ self packageOrganizer packageOfMethod: self reference
]

{ #category : #parsetree }
TLMethodNode >> parseTree [
	^ TLParseTreeService annotation: self compiledMethod
]

{ #category : #accessing }
TLMethodNode >> pragmas [
	^ self compiledMethod pragmas
]

{ #category : #accessing }
TLMethodNode >> reference [
	^ MethodReference class: self actualClass selector: self selector
]

{ #category : #accessing }
TLMethodNode >> reference: aMethodReference [
	self actualClass: aMethodReference actualClass.
	self selector: aMethodReference selector
]

{ #category : #parsetree }
TLMethodNode >> references [
	^ (self compiledMethod allLiterals 
		select: [ :each | [ Smalltalk includesKey: each key ] on: Error do: [ false ] ]
		thenCollect: [ :each | Smalltalk classNamed: each key ]) copyWithout: self actualClass
]

{ #category : #accessing }
TLMethodNode >> selector [
	^ selector
]

{ #category : #accessing }
TLMethodNode >> selector: aSelector [
	selector := aSelector
]

{ #category : #parsetree }
TLMethodNode >> sentMessages [
	^ [ self compiledMethod messages ] on: Error do: [ #() ]
]

{ #category : #parsetree }
TLMethodNode >> statements [
	^ self parseTree statementNode body statements
]
