Class {
	#name : #TLControlling,
	#superclass : #TLMethodRule,
	#category : #'TestLint-TO-BE-FIXED'
}

{ #category : #testing }
TLControlling class >> isAbstract [
	^ self = TLControlling
]

{ #category : #'private run' }
TLControlling >> basicRun [
	^ self node sentMessages intersection: (self systemLogics perform: self controlSelector)
]

{ #category : #testing }
TLControlling >> isSmell: aCollection [
	^ aCollection isEmpty not
]
