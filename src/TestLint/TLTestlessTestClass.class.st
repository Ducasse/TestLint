"
This rule is detecting non-abstract test-classes which do not define any test-methods.

A non-abstract test-class which has no tests is mostly useless. It might contains manual tests (=tests not being detected as tests) only or was forgotten in the testing process. Remove it or define is as abstract and let subclasses use its generic behaviors (if exist).

Rule Properties:
- static analysis of the class
- fast
- high reliability

Smell Properties:
- maybe severe
- not dangerous
"
Class {
	#name : #TLTestlessTestClass,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'run private' }
TLTestlessTestClass >> basicRun [
	^ self node isAbstract not and: [ self node testMethodNodes size = 0 ]
]

{ #category : #testing }
TLTestlessTestClass >> isSmell: aBoolean [
	^ aBoolean
]
