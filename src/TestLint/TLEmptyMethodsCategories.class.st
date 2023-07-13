"
This rules is checking a non-asbstract test-class for empty categories

Empty categories are obsolete and should be removed

Rule Properties:
- static analysis of the test-class
- fast
- maximum reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLEmptyMethodsCategories,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Organization'
}

{ #category : #'private run' }
TLEmptyMethodsCategories >> basicRun [
	^ self node isAbstract
		ifFalse: [ self node methodCategoryNodes 
			select: [ :each | each isEmpty and: [ each isDefault not ] ] ]
		ifTrue: [ #() ]
]

{ #category : #testing }
TLEmptyMethodsCategories >> isSmell: aCollection [
	^ aCollection isEmpty not
]
