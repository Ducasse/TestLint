Class {
	#name : #TLUnmanagedSharedFixtureVariables,
	#superclass : #TLUnusedSharedFixtureVariables,
	#category : #'TestLint-TO-BE-FIXED'
}

{ #category : #'private run' }
TLUnmanagedSharedFixtureVariables >> accessors [
	| accessors fixtureSelectors |
	accessors := super accessors.
	fixtureSelectors := self testingEnvironment allFixtureSelectors.
	accessors do: [ :set | set removeAllSuchThat: [ :each | (fixtureSelectors includes: each selector) not ] ].
	^ accessors
		
]
