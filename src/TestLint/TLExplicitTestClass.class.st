"
This rule is checking whether each source-class has an explicit test-class. 

A class which has no test might not be tested at all.

Rule Properties:
- name matching
- fast
- medium reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLExplicitTestClass,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #testing }
TLExplicitTestClass class >> basicShouldDispatch: aClassNode [
	^ aClassNode isTesting not
]

{ #category : #testing }
TLExplicitTestClass class >> shouldDispatch: aNode [
	^ true
]

{ #category : #'run private' }
TLExplicitTestClass >> basicRun [
	| pattern |
	pattern := '*', self node actualClass name, '*'.
	^ self testingEnvironment allTestClasses select: [ :e |  pattern match: e name ]
]

{ #category : #testing }
TLExplicitTestClass >> isSmell: aCollection [
	^ aCollection isEmpty
]
