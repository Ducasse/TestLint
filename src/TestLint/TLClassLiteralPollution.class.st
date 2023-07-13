"
This rule is detecting test-classes which define literals that are used in more than one method using copy/paste-multiplication

This kind of literal multiplication is more severe than method-internal multiplication. It can lead to fragile tests of the entire test-suite. Furthermore it is decreasing the quality and understandability of the test-database.

This rule will drop multiplications for numbers, booleans, empty string and nil - we focus on the more abstract/complex data.

Rule Properties:
- static analysis of a test-class
- fast
- hish reliability

Smell Properties:
- very severe
- very dangerous
"
Class {
	#name : #TLClassLiteralPollution,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'private run' }
TLClassLiteralPollution >> basicRun [
	^ self filter: (self literals)
]

{ #category : #'private run' }
TLClassLiteralPollution >> filter: aDictionary [
	^ aDictionary removeAllSuchThat: [ :assoc |
		assoc key isNumber 
			or: [ assoc key = true ]
			or: [ assoc key = false ]
			or: [ assoc key isNil ]
			or: [ assoc key isString and: [ assoc key isEmpty ] ] ]; yourself
]

{ #category : #testing }
TLClassLiteralPollution >> isSmell: aDictionary [
	^ aDictionary isEmpty not
]

{ #category : #'private run' }
TLClassLiteralPollution >> literals [
	| literals |
	literals := Dictionary new.
	
	self node testMethodNodes do: [ :each | 
		[ each literals do: [ :lit | literals 
									at: lit value 
									put: ((literals at: lit value ifAbsent: [ Set new ]) add: each; yourself) ] ] 
			on: Error 
			do: [ self result setPartialError ] ].
	
	^ literals removeAllSuchThat: [ :assoc | assoc value size <= 1 ]; yourself
]
