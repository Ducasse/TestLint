Class {
	#name : #TLBrowserAdaptor,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #TestLint
}

{ #category : #'browsing results' }
TLBrowserAdaptor >> browseClassCategories: aCollection [
	<todo: 'needs a lot of work'>
	(aCollection collect: [ :each | each node classCategory ]) inspect
]

{ #category : #'browsing results' }
TLBrowserAdaptor >> browseClasses: aCollection [
	<todo: 'needs a lot of work'>
	(aCollection collect: [ :each | each node actualClass ]) inspect
]

{ #category : #'browsing results' }
TLBrowserAdaptor >> browseMethodCategories: aCollection [
	<todo: 'needs a lot of work'>
	(aCollection collect: [ :each | each node actualClass name, '::', each node methodCategory ]) inspect
]

{ #category : #'browsing results' }
TLBrowserAdaptor >> browseMethods: aCollection [
	<todo: 'needs a lot of work'>
	(aCollection collect: [ :each | each node actualClass name, '>>#', each node selector ]) inspect
]

{ #category : #'browsing results' }
TLBrowserAdaptor >> browsePackages: aCollection [
	<todo: 'needs a lot of work'>
	(aCollection collect: [ :each | each node packageName ]) inspect
]
