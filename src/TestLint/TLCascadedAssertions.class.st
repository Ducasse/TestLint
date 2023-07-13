"
This rule is detecting cascaded assertions.

This is no problem, but a matter of style. Cascaded assertions sometimes(!) obfuscate the focus of the test and the assertion. They should not be used (or at least carefully) in tests.

Rule Properties:
- static analysis of the test-class
- fast
- maximum reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLCascadedAssertions,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #private }
TLCascadedAssertions >> basicRun [
	^ self parseTree: [ self node statements select: [ :each | each isAssertion and: [ each isCascade ] ] ]

]

{ #category : #testing }
TLCascadedAssertions >> isSmell: aCollection [
	^ aCollection isEmpty not
]
