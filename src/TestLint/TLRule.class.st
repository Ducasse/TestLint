Class {
	#name : #TLRule,
	#superclass : #Object,
	#traits : 'TTLRunnable',
	#classTraits : 'TTLRunnable classTrait',
	#instVars : [
		'result'
	],
	#category : #TestLint
}

{ #category : #accessing }
TLRule class >> allSubrules [
	^ self allSubclasses reject: [ :each | each isAbstract ]
]

{ #category : #private }
TLRule class >> basicDispatch: aNode [
	^ self basicDispatchCollection: (Array with: aNode)
]

{ #category : #private }
TLRule class >> basicDispatchCollection: aCollectionOfNodes [
	| results rules |
	
	results := OrderedCollection new.
	rules :=	self isAbstract ifTrue: [ self rules ] ifFalse: [ Array with: self ].
		
	rules do: [ :rule | aCollectionOfNodes 
		do: [ :node | (self basicShouldDispatch: node) ifTrue: [
			results add: (TLRuleResult rule: rule new node: node) ] ] ].

	^ results
]

{ #category : #testing }
TLRule class >> basicShouldDispatch: aNode [
	" test for the node this rule is dedicated to "
	^ false
]

{ #category : #run }
TLRule class >> browse: aCollection [
	aCollection ifNotEmpty: [ self new browse: aCollection ]
]

{ #category : #'run dispatched' }
TLRule class >> dispatch: aNode [
	^ aNode dispatchRule: self
]

{ #category : #'run dispatched' }
TLRule class >> dispatchClass: aClassNode [
	^ self dispatchNode: aClassNode
]

{ #category : #'run dispatched' }
TLRule class >> dispatchClassCategory: aClassCategoryNode [
	^ self dispatchNode: aClassCategoryNode
]

{ #category : #'run dispatched' }
TLRule class >> dispatchMethod: aMethodNode [
	^ self dispatchNode: aMethodNode
]

{ #category : #'run dispatched' }
TLRule class >> dispatchMethodCategory: aMethodCategoryNode [
	^ self dispatchNode: aMethodCategoryNode
]

{ #category : #'run dispatched' }
TLRule class >> dispatchNode: aNode [
	^ (self shouldDispatch: aNode)
		ifTrue: [ aNode perform: self dispatchSelector with: self ]
		ifFalse: [ OrderedCollection new ]
]

{ #category : #'run dispatched' }
TLRule class >> dispatchPackage: aPackageNode [
	^ self dispatchNode: aPackageNode
]

{ #category : #private }
TLRule class >> dispatchSelector [
	^ self subclassResponsibility
]

{ #category : #testing }
TLRule class >> isAbstract [
	^ self == TLRule
]

{ #category : #accessing }
TLRule class >> rules [
	^ self isAbstract
		ifTrue: [ self allSubrules ]
		ifFalse: [ Array with: self ]
]

{ #category : #run }
TLRule class >> run: aNode [
	^ self runNodes: (Array with: aNode)
]

{ #category : #run }
TLRule class >> runEnvironment: aTLEnvironment [
	^ self runNodes: aTLEnvironment nodes
]

{ #category : #run }
TLRule class >> runImage [
	^ self runNodes: self rootNode nodes
]

{ #category : #run }
TLRule class >> runNodes: aCollectionOfNodes [
	^ (TLRunner nodes: aCollectionOfNodes rules: self rules) run
]

{ #category : #testing }
TLRule class >> shouldDispatch: aNode [
	" test for the abstract node "
	^ false
]

{ #category : #accessing }
TLRule class >> withAllSubrules [
	^ self withAllSubclasses reject: [ :each | each isAbstract ]
]

{ #category : #testing }
TLRule >> = aRule [
	^ self class = aRule class
]

{ #category : #'run private' }
TLRule >> basicRun [
	^ self subclassResponsibility
]

{ #category : #run }
TLRule >> browse: aCollection [
	self subclassResponsibility
]

{ #category : #accessing }
TLRule >> browser [
	^ TLBrowserAdaptor new
]

{ #category : #accessing }
TLRule >> description [
	^ self class comment
]

{ #category : #testing }
TLRule >> hash [
	^ self class hash
]

{ #category : #testing }
TLRule >> isSmell: aValue [
	^ self isSmell: aValue for: nil
]

{ #category : #testing }
TLRule >> isSmell: aValue for: aNode [
	^ self subclassResponsibility
]

{ #category : #accessing }
TLRule >> node [
	^ self result node
]

{ #category : #accessing }
TLRule >> parseTree: aBlock [
	^ aBlock 
		on: Error 
		do: [ self result setParseError ]
]

{ #category : #accessing }
TLRule >> result [
	^ result
]

{ #category : #accessing }
TLRule >> result: aResult [
	result := aResult
]

{ #category : #'run private' }
TLRule >> run [
	self shouldIgnore ifTrue: [ self result setIgnored ].
	" self result value: ([ self basicRun ] on: Error do: [ self result setUnexpectedError ]). "
	self result value: self basicRun. 
	self result setAnalysed.
]

{ #category : #run }
TLRule >> run: aNode [
	^ self class run: aNode
]

{ #category : #run }
TLRule >> runImage [
	^ self class runImage
]

{ #category : #run }
TLRule >> runNodes: aCollectionOfNodes [
	^ self class runNodes: aCollectionOfNodes
]

{ #category : #'run private' }
TLRule >> runWith: aResult [
	result := aResult.
	self run
]

{ #category : #testing }
TLRule >> shouldIgnore [
	^ false
]

{ #category : #accessing }
TLRule >> state [
	^ self result state
]
