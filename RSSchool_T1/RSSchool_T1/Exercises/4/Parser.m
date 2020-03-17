#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray *result = [NSMutableArray array];
    
    NSDictionary *openedBracketPairs = @{
        @"(": @")",
        @"[": @"]",
        @"<": @">",
    };
    
    NSMutableArray *openedBracketsStack = [NSMutableArray array];
    NSMutableArray *openedBracketsIndexes = [NSMutableArray array];
    
    for (int i = 0; i < string.length; i++) {
        NSString *symbol = [string substringWithRange:NSMakeRange(i, 1)];
        
        for (int j = (int)openedBracketsStack.count; (j > 0); j--) {
            int bracketStackIndex = j - 1;
            NSString *expectedSymbol = [openedBracketsStack objectAtIndex:bracketStackIndex];
            
            if ([symbol isEqualToString:expectedSymbol]) {
                int openBracketIndex = [[openedBracketsIndexes objectAtIndex:bracketStackIndex] intValue];
                int firstLetterIndex = openBracketIndex + 1;
                NSString *substring = [string substringWithRange:NSMakeRange(firstLetterIndex, i - firstLetterIndex)];
                [result addObject:substring];
            
                [openedBracketsStack removeObjectAtIndex:bracketStackIndex];
                [openedBracketsIndexes removeObjectAtIndex:bracketStackIndex];
                // match found
                break;
            }
        }
        
        NSString *closingBracket = [openedBracketPairs objectForKey:symbol];
        
        if (closingBracket) {
            [openedBracketsStack addObject:closingBracket];
            [openedBracketsIndexes addObject:@(i)];
        }
    }
    
    return result;
}

@end
