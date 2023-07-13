"
This rule is detecting test-methods which include too many literals (no respect to duplication)

This rule will allow 
- AT LEAST and AT MOST as many literals as there are assertions in the test-method (=limitation) 
- AT MOST as the average of statements and assertions (=bonus for long methods)

Literal pollution increases the fragility of a test, reduces its readability and understanability. Furthermore refactorings are prolonged and hardened. Literals ofen expose data of the model.

Rule Properties:
- static analysis of the parse-tree
- fast
- medium reliability

Smell Properties:
- quite severe
- very dangerous
"
Class {
	#name : #TLLiteralPollution,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #'private run' }
TLLiteralPollution >> basicRun [
	^ self literals
]

{ #category : #testing }
TLLiteralPollution >> isSmell: aDictionary [
	| assertions |
	assertions := self node allAssertions size * 2.
	^ aDictionary size >= (assertions max: ((self node statements size + assertions) / 2))
]

{ #category : #'private run' }
TLLiteralPollution >> literals [
	| literals |
	^ self parseTree: [ literals := Dictionary new.
		self node literals do: [ :each | 
			literals 
				at: each value 
				put: ((literals at: each value ifAbsent: [ OrderedCollection new ]) add: each; yourself) ].
		literals ] 
]
