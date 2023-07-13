"
This rules is checking a non-asbstract test-class for uncategorized methods

Uncategorized methods decrease the documentation.

Rule Properties:
- static analysis of the test-class
- fast
- maximum reliability

Smell Properties:
- severe
- not dangerous
"
Class {
	#name : #TLUncategorizedMethods,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Organization'
}

{ #category : #'private run' }
TLUncategorizedMethods >> basicRun [
	^ self node methodNodes select: [ :each | each methodCategoryNode isDefault ]
]

{ #category : #testing }
TLUncategorizedMethods >> isSmell: aCollection [
	^ aCollection isEmpty not
]
