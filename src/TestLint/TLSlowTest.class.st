Class {
	#name : #TLSlowTest,
	#superclass : #TLMethodRule,
	#category : #'TestLint-TO-BE-FIXED'
}

{ #category : #defaults }
TLSlowTest class >> profiler [
	^ MessageTally
]

{ #category : #'private run' }
TLSlowTest >> basicRun [
	| suite profiler |
	suite := self node suite.
	profiler := self class profiler new.
	profiler spyEvery: self class profiler defaultPollPeriod on: [ suite run ].
	^ profiler
]

{ #category : #testing }
TLSlowTest >> isSmell: aProfiler [
	self notYetImplemented
]
