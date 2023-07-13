Extension { #name : #String }

{ #category : #'*TestLint' }
String >> matchesAll: aCollection [
	^ (aCollection detect: [ :each | (each match: self) not ] ifNone: [ nil ]) isNil
]

{ #category : #'*TestLint' }
String >> matchesAny: aCollection [
	^ (aCollection detect: [ :each | each match: self ] ifNone: [ nil ]) isNil not 
]

{ #category : #'*TestLint' }
String >> matchesExactlyAll: aCollection [
	^ (aCollection 
		detect: [ :each | (each = self) not ] 
		ifNone: [ nil ]) isNil
]

{ #category : #'*TestLint' }
String >> matchesExactlyAny: aCollection [
	^ (aCollection 
		detect: [ :each | each = self ] 
		ifNone: [ nil ]) isNil not 
]
