#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableArray *result = [NSMutableArray array];
    
    NSMutableArray *array1 = [NSMutableArray array];
    NSMutableArray *array2 = [NSMutableArray array];
    
    [string1 enumerateSubstringsInRange:NSMakeRange(0, [string1 length])
                                options:(NSStringEnumerationByComposedCharacterSequences)
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [array1 addObject:substring];
    }];
    
    [string2 enumerateSubstringsInRange:NSMakeRange(0, [string2 length])
                                options:(NSStringEnumerationByComposedCharacterSequences)
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [array2 addObject:substring];
    }];
    
    int count = (int)(array1.count + array2.count);
    
    for (int i = 0; i < count; i++) {
        if ([array1[0] stringValue] < [array2[0] stringValue]){
            [result addObject:array1[0]];
            [array1 removeObjectAtIndex:0];
        }
        if ([array1[0] stringValue] > [array2[0] stringValue]){
            [result addObject:array2[0]];
            [array2 removeObjectAtIndex:0];
        }
        if ([array1[0] stringValue] == [array2[0] stringValue]){
            [result addObject:array1[0]];
            [array1 removeObjectAtIndex:0];
        }
    }

    return [result componentsJoinedByString:@""];;
}

@end
