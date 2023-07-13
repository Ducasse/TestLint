Class {
	#name : #StringDistance,
	#superclass : #Object,
	#category : #TestLint
}

{ #category : #'*TestLint' }
StringDistance >> isSimilar [
	^ self distance  < (((rowValue size + columnValue size) / 2) * 0.10)
]
