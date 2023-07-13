Class {
	#name : #TLServices,
	#superclass : #TSSystemRegistrySingleton,
	#instVars : [
		'services'
	],
	#category : #'TestLint-Environment'
}

{ #category : #services }
TLServices >> addService: aService [
	services at: aService class put: aService
]

{ #category : #accessing }
TLServices >> availableServices [
	^ TLService services
]

{ #category : #'system notifications' }
TLServices >> event: anEvent [
	self services do: [ :each | each event: anEvent ]
]

{ #category : #initializing }
TLServices >> initialize [
	self reset.
]

{ #category : #'system notifications' }
TLServices >> register [
	SystemChangeNotifier uniqueInstance notify: self ofAllSystemChangesUsing: #event: 
]

{ #category : #initializing }
TLServices >> registerAvailableServices [
	self availableServices do: [ :each | each register: self ]
]

{ #category : #accessing }
TLServices >> registeredServices [
	^ services
]

{ #category : #services }
TLServices >> removeService: aService [
	services removeKey: aService class ifAbsent: [ ]
]

{ #category : #initializing }
TLServices >> reset [
	services := IdentityDictionary new.
	self registerAvailableServices
]

{ #category : #accessing }
TLServices >> serviceNames [
	services collect: [ :each | each name ]
]

{ #category : #'system notifications' }
TLServices >> unregister [
	SystemChangeNotifier uniqueInstance noMoreNotificationsFor: self
]
