#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray *excludedAllergic = [bill mutableCopy];
    [excludedAllergic removeObjectAtIndex:index];
    
    int sumToSplit = 0;
    
    for (NSNumber *price in excludedAllergic) {
        sumToSplit += [price intValue];
    }
    
    int annaBill = sumToSplit / 2;
    
    if ([sum isEqualToNumber:@(annaBill)]) {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat: @"%i", ([sum intValue] - annaBill)];
    }
}

@end
