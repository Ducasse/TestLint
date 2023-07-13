Class {
	#name : #TLRuleResult,
	#superclass : #Object,
	#instVars : [
		'node',
		'rule',
		'value',
		'state'
	],
	#category : #TestLint
}

{ #category : #'instance creation' }
TLRuleResult class >> rule: aRule node: aNode [
	^ super new initialize
		rule: aRule;
		node: aNode;
		yourself 
]

{ #category : #testing }
TLRuleResult >> = aTLRuleResult [
	^ aTLRuleResult node = self node 
		and: [ aTLRuleResult rule = self rule ]
]

{ #category : #private }
TLRuleResult >> cache [
	self systemTestSmells cache: self
]

{ #category : #testing }
TLRuleResult >> canSmell [
	^ self state canSmell
]

{ #category : #accessing }
TLRuleResult >> hash [
	^ self node hash bitXor: self rule hash
]

{ #category : #initializing }
TLRuleResult >> initialize [
	self node: nil.
	self rule: nil.
	self state: TLState new.
	self value: nil
]

{ #category : #testing }
TLRuleResult >> isError [
	^ self state isError
]

{ #category : #testing }
TLRuleResult >> isExpected [
	^ self state isExpected
]

{ #category : #testing }
TLRuleResult >> isFailure [
	^ self state isFailure
]

{ #category : #testing }
TLRuleResult >> isIgnored [
	^ self state isIgnored
]

{ #category : #testing }
TLRuleResult >> isPass [
	^ self isSmell not
]

{ #category : #testing }
TLRuleResult >> isSmell [
	| effective expected |
	" 	expected + effective -> no smell
		expected + non-effective -> smell 
		non-expected + effective -> smell 
		non-expected + non-effective -> no smell "
		
	effective :=  self canSmell and: [self rule isSmell: self value ].
	expected := self node expectSmell: self rule class.
	
	^ expected
		ifTrue: [ (effective & expected) not]
		ifFalse: [ effective ]
]

{ #category : #accessing }
TLRuleResult >> node [
	^ node
]

{ #category : #accessing }
TLRuleResult >> node: aNode [
	node := aNode
]

{ #category : #accessing }
TLRuleResult >> rule [
	^ rule
]

{ #category : #accessing }
TLRuleResult >> rule: aRule [
	rule := aRule
]

{ #category : #run }
TLRuleResult >> run [
	self rule runWith: self.
	self cache
]

{ #category : #states }
TLRuleResult >> setAnalysed [
	^ self state: self state analysed
]

{ #category : #states }
TLRuleResult >> setIgnored [
	^ self state: self state ignored
]

{ #category : #states }
TLRuleResult >> setParseError [
	self state: self state parseError.
	^ nil
]

{ #category : #states }
TLRuleResult >> setPartialError [
	self state: self state partial
]

{ #category : #states }
TLRuleResult >> setUnexpectedError [
	self state: self state unexpectedError.
	^ nil
]

{ #category : #accessing }
TLRuleResult >> state [
	^ state
]

{ #category : #accessing }
TLRuleResult >> state: aState [
	state := aState
]

{ #category : #private }
TLRuleResult >> systemTestSmells [
	^ SystemTestSmells uniqueInstance
]

{ #category : #accessing }
TLRuleResult >> value [
	^ value
]

{ #category : #accessing }
TLRuleResult >> value: aValue [
	value := aValue
]
