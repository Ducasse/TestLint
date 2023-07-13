"
This rule is detecting test-methods which consists of building-blocks and have a high degree of code similarity

Building Blocks are evidence for:
- code duplication
- missing generic methods

Rule Properties:
- static analysis of source-code
- fast
- medium reliability due hardcoded thresholds

Smell Properties:
- severe
- not dangerous
"
Class {
	#name : #TLSimilarBuildingBlocksTest,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #defaults }
TLSimilarBuildingBlocksTest class >> diffFactor [
	" similarity: ~20%  "
	^ 0.1
]

{ #category : #defaults }
TLSimilarBuildingBlocksTest class >> diffSize [
	" 2 strings can have a deviance of 25% in length "
	^ 0.25
]

{ #category : #'run private' }
TLSimilarBuildingBlocksTest >> basicRun [
	| previous distance |
	
	previous := ''.
	
	(self buildingblocksFor: self node compiledMethod) do: [ :each | 
		(self shouldCompare: each to: previous)
			ifTrue: [
				(self isSimilar: each to: previous distance: (distance := each asString alike: previous asString))
					ifTrue: [ ^ Array with: distance with: each with: previous ] ].
		previous := each ].
	^ #()
]

{ #category : #private }
TLSimilarBuildingBlocksTest >> buildingblocksFor: aCompiledMethod [
	| blocks current stream line |
	
	blocks := OrderedCollection new.
	current := String new.
	
	stream :=  ReadStream on: aCompiledMethod getSource.
	
	[ stream atEnd ] whileFalse: [ 
		line := stream upTo: Character cr.
		line ifEmpty: [ blocks add: current. current := String new ]
			ifNotEmpty: [ current := current, line ] ].
		
	^ blocks
]

{ #category : #private }
TLSimilarBuildingBlocksTest >> isSimilar: aString to: anotherString distance: anInteger [
	^ anInteger > (((aString size + anotherString size) / 2) * self class diffFactor)
]

{ #category : #testing }
TLSimilarBuildingBlocksTest >> isSmell: aCollectionOfBuildingBlocks [
	^ aCollectionOfBuildingBlocks isEmpty not
]

{ #category : #private }
TLSimilarBuildingBlocksTest >> shouldCompare: aString to: anotherString [
	
	| diff |
	aString withBlanksTrimmed size > 0 ifFalse: [ ^ false ].
	anotherString withBlanksTrimmed size > 0 ifFalse: [ ^ false ].
	
	diff := aString size * self class diffSize.
	((anotherString size < (aString size + diff))
		or: [ (anotherString size < (aString size - diff)) ]) ifFalse: [ ^ false ].
	
	^ true
]
