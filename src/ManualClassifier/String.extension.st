Extension { #name : #String }

{ #category : #'*ManualClassifier' }
String >> ~ aBlock [
	^ Category
		withName: self
		condition: aBlock.
]
