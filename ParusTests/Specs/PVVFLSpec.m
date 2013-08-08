#import "PVVFL.h"

SpecBegin(PVVFL)

describe(@"PVVFL", ^{
    __block UIView* view1 = nil;
    __block UIView* view2 = nil;
    __block UIView* container = nil;
    
    beforeEach(^{
        view1 = [UIView new];
        view2 = [UIView new];
        container = [UIView new];
        [container addSubview:view1];
        [container addSubview:view2];
    });
    
    it(@"should create constraints", ^{
        expect(PVVFL(@"|-50-[view1]-50-|").withViews(NSDictionaryOfVariableBindings(view1)).asArray).toNot.beNil();
        expect(PVVFL(@"[view1(==view2)]").fromLeadingToTrailing.withViews(NSDictionaryOfVariableBindings(view1, view2)).asArray).toNot.beNil();
        
        expect(PVVFL(@"|[view1]-20-[view2]|").withViews(NSDictionaryOfVariableBindings(view1, view2)).asArray).toNot.beNil();
        expect(PVVFL(@"V:|-20-[view1]-20-|").fromLeftToRight.withViews(NSDictionaryOfVariableBindings(view1)).asArray).toNot.beNil();
        expect(PVVFL(@"V:|[view1]-20-[view2]|").alignAllLeft.fromLeadingToTrailing.withViews(NSDictionaryOfVariableBindings(view1, view2)).asArray).toNot.beNil();
        
        expect(PVVFL(@"[view1(>=width)]").withViews(NSDictionaryOfVariableBindings(view1)).metrics(@{@"width" : @200}).asArray).toNot.beNil();
    });
});

SpecEnd