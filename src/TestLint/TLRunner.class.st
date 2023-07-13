Class {
	#name : #TLRunner,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'rules',
		'results'
	],
	#category : #TestLint
}

{ #category : #'instance creation' }
TLRunner class >> node: aNode rule: aRule [
	^ self nodes: (Array with: aNode) rules: (Array with: aRule)
]

{ #category : #'instance creation' }
TLRunner class >> node: aNode rules: aCollectionOfRules [
	^ self nodes: (Array with: aNode) rules: aCollectionOfRules
]

{ #category : #'instance creation' }
TLRunner class >> nodes: aCollectionOfNodes rule: aRule [
	^ self nodes: aCollectionOfNodes rules: (Array with: aRule)
]

{ #category : #'instance creation' }
TLRunner class >> nodes: aCollectionOfNodes rules: aCollectionOfRules [
	^ super new initialize
		nodes: aCollectionOfNodes;
		rules: aCollectionOfRules;
		yourself
]

{ #category : #private }
TLRunner >> basicRun [
	^ self results 
		do: [ :each | each run ] 
		displayingProgress: 'Running ', self rules size asString, ' rules on ', self nodes size asString, ' nodes ...';
		yourself
]

{ #category : #accessing }
TLRunner >> nodes [
	^ nodes
]

{ #category : #accessing }
TLRunner >> nodes: aCollectionOfNodes [
	nodes := aCollectionOfNodes asSet
]

{ #category : #accessing }
TLRunner >> results [
	^ results ifNil: [ results := Set new ]
]

{ #category : #accessing }
TLRunner >> rules [
	^ rules
]

{ #category : #accessing }
TLRunner >> rules: aCollectionOfRules [
	rules := aCollectionOfRules asSet
]

{ #category : #run }
TLRunner >> run [
	^ [ self setUp. self basicRun ] 
		ensure: [ self results ]
]

{ #category : #private }
TLRunner >> setUp [
	self results ifEmpty: [
		self rules do: [ :rule | 
			self nodes do: [ :node | self results addAll: (rule dispatch: node) ] ] ].
]
