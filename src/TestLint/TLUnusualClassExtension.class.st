Class {
	#name : #TLUnusualClassExtension,
	#superclass : #TLMethodCategoryRule,
	#category : #'TestLint-Rules-Organization'
}

{ #category : #testing }
TLUnusualClassExtension class >> basicShouldDispatch: aNode [
	^ aNode classNode isTesting
]

{ #category : #'private run' }
TLUnusualClassExtension >> basicRun [
	^ self node isExtension
]

{ #category : #testing }
TLUnusualClassExtension >> isSmell: aBoolean [
	^ aBoolean
]
