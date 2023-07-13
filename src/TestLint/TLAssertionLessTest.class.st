"
This rule is detecting test-methods which do not have any known assertion in the source-code.

Assertionless tests are pretending to be tests. They either pass or thrown an error, but never assert state, functionality or behavior.

Rule Properties:
- static analysis on the parse-tree
- fast
- high reliability, but not failure-prove due static analysis

Smell Properties:
- severe
- not dangerous
"
Class {
	#name : #TLAssertionLessTest,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #'run private' }
TLAssertionLessTest >> basicRun [
	^ self node assertions
]

{ #category : #testing }
TLAssertionLessTest >> isSmell: aValue [
	^ aValue isEmpty
]
