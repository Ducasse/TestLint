"
This rule is detecting tests which use/reference the same literal all over.

see TLiteralPollution.

Rule Properties:
- static analysis of the parse-tree
- fast
- maximum reliability

Smell Properties:
- quite severe
- very dangerous
"
Class {
	#name : #TLLiteralMultiplication,
	#superclass : #TLLiteralPollution,
	#category : #'TestLint-Rules-Method'
}

{ #category : #'private run' }
TLLiteralMultiplication >> basicRun [
	^ super literals 
		ifNotNilDo: [ :col | col select: [ :each | each size > 1 ] ]
		ifNil: [ self result setParseError ]
]

{ #category : #testing }
TLLiteralMultiplication >> isSmell: aDictionary [
	^ aDictionary isEmpty not
]
