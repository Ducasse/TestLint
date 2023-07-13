"
This rule is detecting test-classes which define instance-variables not being accessed by any of 
the local- or subclass-methods.

Unused shared fixture variables are obsolete and should be removed.

Rule Properties:
- static analysis on the test-class
- fast
- maximum reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLUnusedSharedFixtureVariables,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #'private run' }
TLUnusedSharedFixtureVariables >> accessors [
	| accessors |
	accessors := Dictionary new.
	self node actualClass instVarNames do: [ :var |
		self node withAllSubclasses do: [ :class |
			accessors at: var put: ((accessors at: var ifAbsent: [ Set new ]) 
					addAll: ((class actualClass whichSelectorsAccess: var) 
								collect: [ :e | MethodReference class: class actualClass selector: e ]); 
					yourself) ] ].
	^ accessors
]

{ #category : #'private run' }
TLUnusedSharedFixtureVariables >> basicRun [
	^ self accessors
]

{ #category : #testing }
TLUnusedSharedFixtureVariables >> isSmell: aCollection [
	^ (aCollection select: [ :each | each isEmpty ]) keys isEmpty not
]
