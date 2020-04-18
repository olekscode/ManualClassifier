Class {
	#name : #Category,
	#superclass : #Object,
	#instVars : [
		'items',
		'subcategories',
		'condition'
	],
	#category : #ManualClassifier
}

{ #category : #'as yet unclassified' }
Category class >> withCondition: aOneArgumentBlock [
	^ self new condition: aOneArgumentBlock; yourself.
]

{ #category : #visiting }
Category >> accept: aCollectionOfItems [
	"1. Select items that satisfy the condition of this category"
	items := aCollectionOfItems asSet select: condition.
	
	"2. Pass the selected items to subcategories and ask them to check their own conditions"
	subcategories do: [ :category | category accept: items ].
	
	"3. Remove items that were selected by a subcategory (they were 'moved down')"
	items removeAllSuchThat: [ :item |
		subcategories anySatisfy: [ :category |
			category includes: item ] ].
	
	"4. Check for ducplicates"
]

{ #category : #'as yet unclassified' }
Category >> addSubcategoriesByCrossTabulating: oneCondition with: anotherCondition [
	subcategories := {
		self class withCondition: (oneCondition and: anotherCondition) .
		self class withCondition: (oneCondition not and: anotherCondition) .
		self class withCondition: (oneCondition and: anotherCondition not) .
		self class withCondition: (oneCondition not and: anotherCondition not) }.
]

{ #category : #'as yet unclassified' }
Category >> addSubcategory: aCategory [
	subcategories add: aCategory
]

{ #category : #accessing }
Category >> condition [
	^ condition
]

{ #category : #accessing }
Category >> condition: aOneArgumentBlock [
	condition := aOneArgumentBlock
]

{ #category : #defaults }
Category >> defaultCondition [
	"Accept everything by default"
	^ [ :anObject | true ]
]

{ #category : #'as yet unclassified' }
Category >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 1>
	composite list 
		title: 'Items';
		display: [ self items ].
]

{ #category : #'as yet unclassified' }
Category >> gtInspectorTreeIn: composite [
	<gtInspectorPresentationOrder: 0>
	composite tree 
		title: 'Tree';
		display: [ self ];
		children: [ :each | each subcategories ].
]

{ #category : #testing }
Category >> includes: anItem [
	^ items includes: anItem
]

{ #category : #initialization }
Category >> initialize [ 
	super initialize.
	items := Set new.
	subcategories := OrderedCollection new.
	condition := self defaultCondition.
]

{ #category : #accessing }
Category >> items [
	^ items
]

{ #category : #printing }
Category >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: items size asString;
		nextPut: $);
		space;
		nextPutAll: condition asString.
]

{ #category : #accessing }
Category >> subcategories [
	^ subcategories
]
