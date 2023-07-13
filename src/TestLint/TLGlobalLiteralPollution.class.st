Class {
	#name : #TLGlobalLiteralPollution,
	#superclass : #TLPackageRule,
	#category : #'TestLint-TO-BE-FIXED'
}

{ #category : #testing }
TLGlobalLiteralPollution class >> basicShouldDispatch: aMethodNode [
	^ true
]

{ #category : #testing }
TLGlobalLiteralPollution class >> shouldDispatch: aMethodNode [
	^ true
]

{ #category : #'private run' }
TLGlobalLiteralPollution >> basicRun [
	| testLiterals nonTestLiterals |
	testLiterals := Dictionary new.
	nonTestLiterals := Dictionary new.
	self node testMethodNodes 
		ifNotEmptyDo: [ :col | 
			testLiterals := self literals: col.
			nonTestLiterals := self literals: self node nonTestMethodNodes ] .
	^ (testLiterals keys intersection: nonTestLiterals keys)
]

{ #category : #'private run' }
TLGlobalLiteralPollution >> filter: aDictionary [
	^ aDictionary removeAllSuchThat: [ :assoc |
		assoc value isEmpty
			or: [ assoc key = true or: [ assoc key = 'true' ] ]
			or: [ assoc key = false or: [ assoc key = 'false' ] ]
			or: [ assoc key isNil or: [ assoc key = 'nil' ]]
			or: [ assoc key isString and: [ assoc key isEmpty ] ] ]; yourself
]

{ #category : #testing }
TLGlobalLiteralPollution >> isSmell: aCollection [
	^ aCollection isEmpty not 
]

{ #category : #'private run' }
TLGlobalLiteralPollution >> literals: aCollection [
	| literals |
	literals := Dictionary new.
	
	aCollection do: [ :each | 
		[ each literals do: [ :lit | literals 
									at: lit value 
									put: ((literals at: lit value ifAbsent: [ Set new ]) add: each; yourself) ] ] 
			on: Error 
			do: [ self result setPartialError ] ].
	
	^ self filter: literals
]
