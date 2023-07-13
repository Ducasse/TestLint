"
This rule is detecting test-methods which reference 
	- too many different classes (maxReferenceTypes >3 )
	- or the same class too often (maxTypeReferences > 3)

Overreferencing is an evidence for:
- code-duplication
- missing generic methods
- high code coupling
- fast testing

Rule Properties:
- static analysis on the parse-tree
- fast
- medium reliability, the hardcoded thresholods might not work for all cases

Smell Properties:
- severe
- not dangerous
"
Class {
	#name : #TLOverreferencingTest,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #defaults }
TLOverreferencingTest class >> maxReferenceTypes [
	^ 3
	
]

{ #category : #defaults }
TLOverreferencingTest class >> maxTypeReferences [
	^ 3
	
]

{ #category : #'run private' }
TLOverreferencingTest >> basicRun [
	| counter |
	counter := Dictionary new.
	 self node references 
		do: [ :ref | counter at: ref put: 1 + (counter at: ref ifAbsent: [ 0 ]) ].
	^ counter

]

{ #category : #testing }
TLOverreferencingTest >> isSmell: aCounterDictionary [
	^ (aCounterDictionary 
			detect: [ :val | val > self class maxTypeReferences ] ifNone: [ nil ]) isNil not
		or: [ aCounterDictionary size > self class maxReferenceTypes ]
]
