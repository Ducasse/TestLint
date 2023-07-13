"
see TLiteralPollution.

This rule is less strict than TLiteralPollution. It will allow one literal per sent message (=quite generous)
"
Class {
	#name : #TLTolerantLiteralPollution,
	#superclass : #TLLiteralPollution,
	#category : #'TestLint-Rules-Method'
}

{ #category : #testing }
TLTolerantLiteralPollution >> isSmell: aDictionary [
	^ aDictionary size > self node allSentMessages size
]
