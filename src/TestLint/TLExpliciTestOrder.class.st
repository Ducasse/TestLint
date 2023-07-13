"
This rule is detecting test-classes which contain test-methods explicitly calling other test-methods. We only respect the local test-methods and the ones of the superclass - we assume rather flat hierarchies in tests.

Explicit test order is rather unusual for unit-testing, but common for example-testing. Only use where absolutely necessary. Be careful with calling yourself - This rule cannot detect loops.

Rule Properties:
- static analysis of a test-class
- fast
- maximum reliability

Smell Properties:
- maybe severe
- maybe dangerous
"
Class {
	#name : #TLExpliciTestOrder,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'private run' }
TLExpliciTestOrder >> basicRun [
	| testMethodNodes testSelectors explicitTestCalls |
	explicitTestCalls := OrderedCollection new.
	testMethodNodes := self node testMethodNodes, self node superClassNode testMethodNodes.
	testSelectors := testMethodNodes collect: [ :each | each selector ].
	
	testMethodNodes do: [ :node | | messages |
		messages := node sentMessages.
		testSelectors do: [ :sel |
			(sel matchesExactlyAny: messages) ifTrue: [ explicitTestCalls add: ( node -> sel ) ] ] ].
		
	^ explicitTestCalls
]

{ #category : #'private run' }
TLExpliciTestOrder >> hasExplicitTestCall: aMethodNode in: aCollectionOfSelectors [
	^ (aMethodNode sentMessages intersection: aCollectionOfSelectors) isEmpty not
]

{ #category : #testing }
TLExpliciTestOrder >> isSmell: aCollection [
	^ aCollection isEmpty not
]
