"
This rule is detecting classes which define 'too many' instance variables.

A test-class / a test-fixture is not supposed to use 'too many' instance variables as they obfuscate the code and might cause side-effects if not properly managed by the shared fixture. The default value is '4' - seems to be a good threshold ...

Rule Properties:
- static analysis of the class
- fast
- high reliability

Smell Properties:
- not severe
- not dangerous
"
Class {
	#name : #TLMaxSharedFixtureVariables,
	#superclass : #TLClassRule,
	#category : #'TestLint-Rules-Class'
}

{ #category : #defaults }
TLMaxSharedFixtureVariables class >> maxInstanceVariables [
	^ 4
]

{ #category : #'run private' }
TLMaxSharedFixtureVariables >> basicRun [
	^ self node actualClass instanceVariableNames
]

{ #category : #testing }
TLMaxSharedFixtureVariables >> smells: aCollection [
	^ aCollection size > self class maxInstanceVariables
]
