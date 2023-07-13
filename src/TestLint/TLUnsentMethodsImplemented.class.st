"
This rule is detecting test-classes which implement methods never used by the test-class or any of its subclasses.

Unsent methods are not used and should be removed from the test-class.

Rule Properties:
- static analysis of the class
- fast
- high reliability

Smell Properties:
- severe
- not dangerous
"
Class {
	#name : #TLUnsentMethodsImplemented,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'run private' }
TLUnsentMethodsImplemented >> basicRun [

	| unsentMethods |
	unsentMethods := Set new.

	" filtering using ifEmpty/IfNotEmpty for speeding up the analysis "
	(self node utilMethodNodes collect: [ :each | each selector ]) do: [ :selector |
		(self selfSenders: selector) 
			ifNotEmpty: [ ^ unsentMethods ] 
			ifEmpty: [ (self subclassSenders: selector)
				ifNotEmpty: [ ^ unsentMethods ]
				ifEmpty: [ (self superclassSenders: selector)
					ifNotEmpty: [ ^ unsentMethods ]
					ifEmpty: [ unsentMethods add: selector ] ] ] ].
	
	^ unsentMethods
		
]

{ #category : #testing }
TLUnsentMethodsImplemented >> isSmell: aCollectionOfUnsentMethods [
	^ aCollectionOfUnsentMethods isEmpty not
]

{ #category : #'run private' }
TLUnsentMethodsImplemented >> selfSenders: aSelector [
	^ self senders: aSelector in: (Array with: self node actualClass)
]

{ #category : #'run private' }
TLUnsentMethodsImplemented >> senders: aSelector in: aCollection [
	^ SystemNavigation default allMethodReferencesFrom: aCollection sending: aSelector
]

{ #category : #'run private' }
TLUnsentMethodsImplemented >> subclassSenders: aSelector [
	^ self senders: aSelector in: self node actualClass allSubclasses
]

{ #category : #'run private' }
TLUnsentMethodsImplemented >> superclassSenders: aSelector [
	^ self senders: aSelector in: self node actualClass allSuperclasses
]
