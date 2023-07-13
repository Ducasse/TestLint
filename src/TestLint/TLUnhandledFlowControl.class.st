Class {
	#name : #TLUnhandledFlowControl,
	#superclass : #TLMethodRule,
	#category : #'TestLint-TO-BE-FIXED'
}

{ #category : #defaults }
TLUnhandledFlowControl class >> defaultClass [
	^ self subclassResponsibility
]

{ #category : #defaults }
TLUnhandledFlowControl class >> defaultPattern [
	^ self subclassResponsibility
]

{ #category : #testing }
TLUnhandledFlowControl class >> isAbstract [
	^ self == TLUnhandledFlowControl
]

{ #category : #'run private' }
TLUnhandledFlowControl >> basicRun [
	^ (self node sentMessages 
		detect: [ :msg | self class defaultPattern match: msg ] ifNone: [ nil ]) isNil
			ifTrue: [ false ]
			ifFalse: [ (self node references 
				detect: [ :cl | self class defaultClass match: cl name ] 
				ifNone: [ nil ]) isNil ]
		
]

{ #category : #testing }
TLUnhandledFlowControl >> isSmell: aValue [
	^ aValue
]
