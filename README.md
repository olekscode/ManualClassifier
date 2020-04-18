# ManualClassifier

## How to install it?

To install `ManualClassifier`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'ManualClassifier';
  repository: 'github://olekscode/ManualClassifier/src';
  load.
```

## How to depend on it?

If you want to add a dependency on `ManualClassifier` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'ManualClassifier'
  with: [ spec repository: 'github://olekscode/ManualClassifier/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?
