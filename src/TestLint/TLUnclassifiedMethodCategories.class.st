"
This rule is detecting test-classes which define unclassified-method-categories.

An unclassified method-category is obsolete and should be removed or properly named as it doesn't document the fucntionality containing. Bad naming or organization can be an obstacle in quickly understanding a test and the model beneath.

Rule Properties:
- static analysis of a test-class
- fast
- maximum reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLUnclassifiedMethodCategories,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Organization'
}

{ #category : #'private run' }
TLUnclassifiedMethodCategories >> basicRun [
	^ self node methodCategoryNodes select: [ :each | each isDefault ]
]

{ #category : #testing }
TLUnclassifiedMethodCategories >> isSmell: aCollection [
	^ aCollection isEmpty not
]
