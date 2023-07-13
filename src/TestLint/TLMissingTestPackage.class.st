"
This rule is detecting packages which do not define tests or don't have a sibling-package that includes all the tests.

TDD requires to have a test for each functionality.

Smell Properties:
- static analysis on packages
- fast
- maximum reliability

Smell:
- maybe severe
- maybe dangerous
"
Class {
	#name : #TLMissingTestPackage,
	#superclass : #TLPackageRule,
	#category : #'TestLint-Rules-Organization'
}

{ #category : #testing }
TLMissingTestPackage class >> basicShouldDispatch: aNode [
	^ true
]

{ #category : #testing }
TLMissingTestPackage class >> shouldDispatch: aNode [
	^ true
]

{ #category : #'private run' }
TLMissingTestPackage >> basicRun [
	^ self node isTesting
		ifTrue: [ self node ]
		ifFalse: [ self packageOrganizer packages
					detect: [ :each | self haveRelation: self node and: each ]
					ifNone: [ nil ] ]
]

{ #category : #'private run' }
TLMissingTestPackage >> haveRelation: aPackage and: aPackageInfo [
	
	aPackage packageInfo = aPackageInfo ifTrue: [ ^ false ].
	^ ((('*', aPackage packageInfo packageName, '*') match: aPackageInfo packageName) 
			or: [ ('*', aPackageInfo packageName, '*') match: aPackage packageInfo packageName ])
		and: [ aPackageInfo asTLNode isTesting ]
]

{ #category : #testing }
TLMissingTestPackage >> isSmell: anObject [
	^ anObject isNil
]
