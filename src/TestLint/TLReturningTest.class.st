Class {
	#name : #TLReturningTest,
	#superclass : #TLMethodRule,
	#category : #'TestLint-Rules-Method'
}

{ #category : #testing }
TLReturningTest class >> isAbstract [
	^ self = TLReturningTest
]
