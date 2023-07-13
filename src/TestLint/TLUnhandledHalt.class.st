Class {
	#name : #TLUnhandledHalt,
	#superclass : #TLUnhandledFlowControl,
	#category : #'TestLint-TO-BE-FIXED'
}

{ #category : #defaults }
TLUnhandledHalt class >> defaultClass [
	^ '*Halt*'
]

{ #category : #defaults }
TLUnhandledHalt class >> defaultPattern [
	^ 'halt*'
]
