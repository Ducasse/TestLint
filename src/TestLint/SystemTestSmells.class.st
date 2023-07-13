Class {
	#name : #SystemTestSmells,
	#superclass : #TLSystemSingleton,
	#instVars : [
		'results'
	],
	#category : #'TestLint-Environment'
}

{ #category : #defaults }
SystemTestSmells class >> defaultSize [
	^ 1000000
]

{ #category : #accessing }
SystemTestSmells >> allResultsOfNode: aNode [
	^ self deepResultsFor: aNode with: #nodeSelector and: #includes:
]

{ #category : #private }
SystemTestSmells >> association: aTLRuleResult [
	^ Association new
		perform: self nodeSelector asMutator with: aTLRuleResult node;
		perform: self ruleSelector asMutator with: aTLRuleResult rule;
		yourself
		
]

{ #category : #accessing }
SystemTestSmells >> cache: aTLRuleResult [
	results at: (self association: aTLRuleResult) put: aTLRuleResult
]

{ #category : #private }
SystemTestSmells >> deepResultsFor: anObject with: aSelector and: anotherSelector [
	^ results associations 
		select: [ :each | anObject perform: anotherSelector with: (each key perform: self aSelector) ]
		thenCollect: [ :each | each value ]
]

{ #category : #initializing }
SystemTestSmells >> initialize [
	self reset
]

{ #category : #private }
SystemTestSmells >> nodeSelector [
	^ #key
]

{ #category : #initializing }
SystemTestSmells >> reset [
	results := Dictionary new: self class defaultSize
]

{ #category : #accessing }
SystemTestSmells >> results [
	^ results values
]

{ #category : #accessing }
SystemTestSmells >> resultsOfNode: aNode [
	^ self simpleResultsFor: aNode with: #nodeSelector
]

{ #category : #accessing }
SystemTestSmells >> resultsOfRule: aRule [
	^ self simpleResultsFor: aRule with: #ruleSelector
]

{ #category : #private }
SystemTestSmells >> ruleSelector [
	^ #value
]

{ #category : #private }
SystemTestSmells >> simpleResultsFor: anObject with: aSelector [
	^ results associations 
		select: [ :each | (each key perform: self aSelector) = anObject ]
		thenCollect: [ :each | each value ]
]
