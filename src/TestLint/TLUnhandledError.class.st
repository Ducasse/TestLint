Class {
	#name : #TLUnhandledError,
	#superclass : #TLUnhandledFlowControl,
	#category : #'TestLint-TO-BE-FIXED'
}

{ #category : #defaults }
TLUnhandledError class >> defaultClass [
	^ '*Error*'
]

{ #category : #defaults }
TLUnhandledError class >> defaultPattern [
	^ 'error*'
]
