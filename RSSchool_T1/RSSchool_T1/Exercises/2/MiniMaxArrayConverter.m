#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    int minIndex = 0;
    int maxIndex = 0;
    
    for (int i = 1; i < array.count; i++) {
        int minValue = [array[minIndex] intValue];
        int maxValue = [array[maxIndex] intValue];
        
        int value = [array[i] intValue];
        
        if (value < minValue) {
            minIndex = i;
        }
        
        if (value > maxValue) {
            maxIndex = i;
        }
    }
    
    NSMutableArray *minArray = [array mutableCopy];
    [minArray removeObjectAtIndex:maxIndex];
    NSNumber *minSum = [self sumArrayValues:minArray];
    
    NSMutableArray *maxArray = [array mutableCopy];
    [maxArray removeObjectAtIndex:minIndex];
    NSNumber *maxSum = [self sumArrayValues:maxArray];
    
    
    return @[minSum, maxSum];
}

- (NSNumber *)sumArrayValues:(NSArray<NSNumber*>*)array {
    int sum = 0;
    
    for (NSNumber *number in array) {
        sum += [number intValue];
    }
    
    return @(sum);
}

@end
