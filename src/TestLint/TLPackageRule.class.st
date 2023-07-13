Class {
	#name : #TLPackageRule,
	#superclass : #TLRule,
	#category : #TestLint
}

{ #category : #private }
TLPackageRule class >> dispatchSelector [
	^ #dispatchPackageRule:
]

{ #category : #testing }
TLPackageRule class >> isAbstract [
	^ self == TLPackageRule
]

{ #category : #run }
TLPackageRule >> browse: aCollection [
	self browser browsePackages: aCollection
]
