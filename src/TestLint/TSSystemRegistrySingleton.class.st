Class {
	#name : #TSSystemRegistrySingleton,
	#superclass : #TLSystemSingleton,
	#category : #'TestLint-Environment'
}

{ #category : #initializing }
TSSystemRegistrySingleton class >> reset [
	uniqueInstance isNil 
		ifFalse: [ uniqueInstance unregister. uniqueInstance := nil ].

]

{ #category : #initializing }
TSSystemRegistrySingleton >> initialize [
	super initialize.
	self register
]

{ #category : #'system notifications' }
TSSystemRegistrySingleton >> register [
	self subclassResponsibility
]

{ #category : #'system notifications' }
TSSystemRegistrySingleton >> unregister [
	SystemChangeNotifier uniqueInstance noMoreNotificationsFor: self
]
