Trait {
	#name : #TTLRunnable,
	#category : #TestLint
}

{ #category : #'methodsFor:' }
TTLRunnable >> allNodes [
	^ self rootNode nodes
]

{ #category : #'methodsFor:' }
TTLRunnable >> allRules [
	^ self rootRule rules
]

{ #category : #'methodsFor:' }
TTLRunnable >> isAbstract [
	^ self subclassResponsibility
]

{ #category : #accessing }
TTLRunnable >> packageOrganizer [
	^ self class packageOrganizer
]

{ #category : #'methodsFor:' }
TTLRunnable >> rootNode [
	^ TLNode
]

{ #category : #'methodsFor:' }
TTLRunnable >> rootRule [
	^ TLRule
]

{ #category : #accessing }
TTLRunnable >> systemAssertions [
	^ SystemAssertions uniqueInstance
]

{ #category : #accessing }
TTLRunnable >> systemEnvironment [
	^ self class systemEnvironment
]

{ #category : #accessing }
TTLRunnable >> systemLogics [
	^ self class systemLogics
]

{ #category : #accessing }
TTLRunnable >> testingEnvironment [
	^ self class testingEnvironment
]
