Class {
	#name : #TLRedundantClassExtension,
	#superclass : #TLUnusualClassExtension,
	#category : #'TestLint-Rules-Organization'
}

{ #category : #'private run' }
TLRedundantClassExtension >> basicRun [
	^ super basicRun and: [ self node packageNode = self node classNode packageNode ]
]
