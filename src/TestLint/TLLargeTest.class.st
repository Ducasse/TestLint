"
This rule is detecting test-methods which contain too much code.

Large/Long tests can lead to 
- obfuscation
- reduced understandability of test- and model-code

Rule Properties:
- static analysis on the parse-tree
- fast
- low reliability

Smell Properties:
- severe
- dangerous
"
Class {
	#name : #TLLargeTest,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #defaults }
TLLargeTest class >> maxStatements [
	^ 20
]

{ #category : #'run private' }
TLLargeTest >> basicRun [
	^ self parseTree: [ self node statements ]
]

{ #category : #testing }
TLLargeTest >> isSmell: aCollectionOfStatements [
	^ aCollectionOfStatements size > self class maxStatements
]
