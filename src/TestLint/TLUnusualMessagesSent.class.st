"
This rule is checking a test-method for unusual messages:

- notYetImplemented 
- shouldNotImplement 
- shouldBeImplemented

Rule Properties:
- static analysis on the parse-tree
- fast
- maximum reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLUnusualMessagesSent,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #defaults }
TLUnusualMessagesSent class >> unusualMessages [
	^ #(notYetImplemented shouldNotImplement shouldBeImplemented)
]

{ #category : #'run basic' }
TLUnusualMessagesSent >> basicRun [	
	^ self class unusualMessages select: [ :msg | self node sentMessages includes: msg ]
]

{ #category : #testing }
TLUnusualMessagesSent >> isSmell: aCollection [
	^ aCollection isEmpty not
]
