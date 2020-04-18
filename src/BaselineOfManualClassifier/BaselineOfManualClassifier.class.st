Class {
	#name : #BaselineOfManualClassifier,
	#superclass : #BaselineOf,
	#category : #BaselineOfManualClassifier
}

{ #category : #baselines }
BaselineOfManualClassifier >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"External dependencies"
		spec
			baseline: 'BlockClosureLogicalOperations'
			with: [ spec repository: 'github://olekscode/BlockClosureLogicalOperations/src' ].
			
		"Packages"
		spec 
			package: 'ManualClassifier' with: [ spec requires: #(BlockClosureLogicalOperations) ];
			package: 'ManualClassifier-Tests' with: [ spec requires: #(ManualClassifier) ] ].
]
