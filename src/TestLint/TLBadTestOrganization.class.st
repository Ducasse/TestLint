"
This rules is checking whether the tests of a non-abstract test-class are properly organized

properly organized <-->
- each test-method in a category named *test* or *run* (naming)
- each category is EITHER containing test-methods OR non-test methods (mixing)

Bad organization of tests decrease the documentation.

Rule Properties:
- static analysis of the test-class
- fast
- maximum reliability

Smell Properties:
- severe
- not dangerous
"
Class {
	#name : #TLBadTestOrganization,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Organization'
}

{ #category : #defaults }
TLBadTestOrganization class >> defaultPatterns [
	^ #( '*test*' '*run*' )
]

{ #category : #'private run' }
TLBadTestOrganization >> basicRun [
	| badlyOrganized |
	badlyOrganized := OrderedCollection new.
	
	self node methodCategoryNodes do: [ :each | each isTesting 
		ifTrue: [ (self hasTestName: each)
			ifFalse: [ badlyOrganized add: each ] 
			ifTrue: [ each nonTestMethodNodes isEmpty
				ifFalse: [ badlyOrganized add: each ] ] ] ].

	^ badlyOrganized
]

{ #category : #'private run' }
TLBadTestOrganization >> hasTestName: aMethodCategoryNode [
	^ aMethodCategoryNode methodCategory matchesAny: self class defaultPatterns
]

{ #category : #testing }
TLBadTestOrganization >> isSmell: aCollection [
	^ aCollection isEmpty not
]
