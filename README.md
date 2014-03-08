Parus
=====

Parus  varius is a perching bird from the tit family, Paridae. It occurs in eastern Asia in Japan, Korea, Taiwan, and locally in northeastern China (southern Liaoning) and extreme southeastern Russia (southern Kurile Islands).

Also, Parus is a small objective-c DSL for AutoLayout in code.

![Parus Varius in wild life](http://upload.wikimedia.org/wikipedia/commons/e/ee/Poecile_varius_on_plate.JPG)

Examples
=====

Usual single constraint example:
```obj-c
NSLayoutConstraint* constraint = [NSLayoutConstraint constraintWithItem:view
                                                              attribute:NSLayoutAttributeLeft
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:superview
                                                              attribute:NSLayoutAttributeLeft
                                                             multiplier:1.0
                                                               constant:10];
```
With Parus:
```obj-c
NSLayoutConstraint* constraint = PVLeftOf(view).equalTo.leftOf(superview).plus(10).asConstraint;
```

VFL example:
```obj-c
NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-padding-[view]-padding-|"
                                                               options:NSLayoutFormatAlignAllTop | NSLayoutFormatDirectionLeadingToTrailing
                                                               metrics:@{@"padding" : @20}
                                                                 views:NSDictionaryOfVariableBindings(view)];
```
With Parus:
```obj-c
NSArray* constraints = PVVFL(@"|-padding-[view]-padding-|").alignAllTop.fromLeadingToTrailing.withViews(NSDictionaryOfVariableBindings(view)).metrics(@{@"padding": @20}).asArray;
```

Features
=====
* It is easy to create constraints - just like writing a sentence
* More compact and semantical than usual NSAutoLayout
* Flexibility in creating constraints - you specify only parameters that you need

Installation
=====

Use [cocoapods](http://cocoapods.org/)!

TODO
====
* Extend debug description
* Category for NSString as a start point for creating VFL


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/DAlOG/parus/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

