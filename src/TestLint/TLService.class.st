Class {
	#name : #TLService,
	#superclass : #Object,
	#category : #'TestLint-Environment'
}

{ #category : #testing }
TLService class >> isAbstract [
	^ true
]

{ #category : #accessing }
TLService class >> services [
	^ self allSubclasses select: [ :each | each isAbstract not ] thenCollect: [ :each | each new ]
]

{ #category : #'event actions' }
TLService >> basicEvent: anEvent [
]

{ #category : #'event actions' }
TLService >> event: anEvent [
]

{ #category : #testing }
TLService >> isService [
	^ true
]

{ #category : #accessing }
TLService >> name [
	^ self class name
]

{ #category : #'system notifications' }
TLService >> register: aRegistry [
	aRegistry addService: self
]

{ #category : #'system notifications' }
TLService >> unregister: aRegistry [
	aRegistry removeService: self
]
