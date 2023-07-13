"
see TLClassName -- difference: this rule is more strict
"
Class {
	#name : #TLStrictClassName,
	#superclass : #TLClassName,
	#category : #'TestLint-Rules-Organization'
}

{ #category : #defaults }
TLStrictClassName class >> namePatterns [
	^ #( 'Test*' '*Test' )
]
