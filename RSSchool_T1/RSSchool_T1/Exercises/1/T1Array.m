#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (!sadArray.count) {
        return sadArray;
    }
    
    NSMutableArray* result = [[NSMutableArray alloc] initWithArray:sadArray];
    
    for (int i = 1; i < result.count - 1 ; i++) {
        int value = [result[i] intValue];
        int neighbors = [result[i - 1] intValue] + [result[i + 1] intValue];
        
        if (value > neighbors) {
            [result removeObjectAtIndex: i];
            i = i > 1 ? (i - 2) : (i - 1);
        }
    }
    
    return (NSArray*)result;
}

@end
