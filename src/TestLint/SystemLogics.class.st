Class {
	#name : #SystemLogics,
	#superclass : #TSSystemRegistrySingleton,
	#instVars : [
		'enumerations'
	],
	#category : #'TestLint-Environment'
}

{ #category : #defaults }
SystemLogics class >> branchesPatterns [
	^ #( 'if*true*' 'if*false*' 'if*empty*' 'if*nil*' 'if*error*' )
]

{ #category : #defaults }
SystemLogics class >> enumerationPatterns [
	^ { 
		Collection->'enum*'. 
		Number->'inter*'.
		BlockClosure->'control*'.
	 }
]

{ #category : #defaults }
SystemLogics class >> operatorPatterns [
	^ #( 'and:*' 'or:*' 'not' '&*' '|*' )
]

{ #category : #accessing }
SystemLogics >> allBranches [
	^ self operators: #isBranch:
]

{ #category : #accessing }
SystemLogics >> allEnumerations [
	^ enumerations ifNil: [ enumerations := self enumerations ]
]

{ #category : #accessing }
SystemLogics >> allOperators [
	^ self operators: #isOperator:
]

{ #category : #private }
SystemLogics >> enumerations [
	| set |
	set := Set new.
	self class enumerationPatterns do: [ :assoc |
		set addAll:( self enumerationsOf: assoc key with: assoc value).
		assoc key allSubclasses do: [ :class | 
			set addAll: (self enumerationsOf: class with: assoc value) ] ].
	
	^ set
]

{ #category : #private }
SystemLogics >> enumerationsOf: aClass with: aCategoryPattern [
	| enums |
	enums := Set new.
	(aClass organization categories select: [ :each | aCategoryPattern match: each ])
		do: [ :each | enums addAll: (aClass organization listAtCategoryNamed: each) ].
	^ enums

]

{ #category : #testing }
SystemLogics >> isBranch: aCompiledMethod [
	^ self isOperator: aCompiledMethod matching: self class branchesPatterns
]

{ #category : #testing }
SystemLogics >> isBranchMessage: aSelector [
	^ self isOperatorMessage: aSelector matching: self class branchesPatterns
]

{ #category : #testing }
SystemLogics >> isOperator: aCompiledMethod [
	^ self isOperator: aCompiledMethod matching: self class operatorPatterns
]

{ #category : #private }
SystemLogics >> isOperator: aCompiledMethod matching: aPattern [
	^ self isOperatorMessage: aCompiledMethod selector matching: aPattern
]

{ #category : #private }
SystemLogics >> isOperatorMessage: aSelector matching: aPattern [
	^ aSelector matchesAny: aPattern
]

{ #category : #'system notifications' }
SystemLogics >> methodModified: anEvent [
	self update: anEvent item
]

{ #category : #'system notifications' }
SystemLogics >> methodRemoved: anEvent [
	self removeEnumerations: anEvent item
]

{ #category : #private }
SystemLogics >> operators: aSelector [
	^ (Smalltalk allClassesAndTraits 
		gather: [ :each | each methodDict select: [ :cm | self perform: aSelector with: cm ] ])
		collect: [ :each | each reference ]
]

{ #category : #'system notifications' }
SystemLogics >> register [
	SystemChangeNotifier uniqueInstance 
		notify: self ofSystemChangesOfItem: #method change: #Added using: #methodModified: ;
		notify: self ofSystemChangesOfItem: #method change: #Modified using: #methodModified: ;
		notify: self ofSystemChangesOfItem: #method change: #Removed using: #methodRemoved:
]

{ #category : #'system notifications' }
SystemLogics >> removeEnumerations: aCompiledMethod [
	self allEnumerations remove: aCompiledMethod selector ifAbsent: []
]

{ #category : #'system notifications' }
SystemLogics >> update: aCompiledMethod [
	self updateEnumerations: aCompiledMethod
]

{ #category : #'system notifications' }
SystemLogics >> updateEnumerations: aCompiledMethod [
	(self class enumerationPatterns
			detect: [ :assoc | assoc key = aCompiledMethod actualClass ]
			ifNone: [ nil ])
		ifNotNilDo: [ :assoc |
			self allEnumerations addAll: (self enumerationsOf: aCompiledMethod actualClass with: assoc value) ]
]
