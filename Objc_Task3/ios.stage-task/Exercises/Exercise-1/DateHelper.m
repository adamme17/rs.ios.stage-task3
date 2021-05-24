#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSMutableArray *arr;

    arr = [NSMutableArray arrayWithObjects: @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
    
    if (monthNumber > 12 || monthNumber < 1) {
        return nil;
    }
    
    NSString *value = arr[monthNumber - 1];
    return value;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
        
    NSMutableString *s1 = [date mutableCopy];
    NSMutableString *s2 = [date mutableCopy];
    
    NSRange range1 = NSMakeRange(0, 5);
    [s1 deleteCharactersInRange:range1];
    int month = [s1 intValue];
    
    if (month > 12 || month < 1) {
        return 0;
    }
    
    NSRange range2 = NSMakeRange(0, 8);
    [s2 deleteCharactersInRange:range2];
    int day = [s2 intValue];
    
    if (day > 31 || day < 1) {
        return 0;
    }
    
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSCalendar * currentCalendar = [NSCalendar currentCalendar];
        NSDateComponents *dateComponents = [currentCalendar components:NSCalendarUnitWeekday fromDate:date];
    
    NSString *result;

    if (dateComponents.weekday == 2) result = @"Пн";
    if ( dateComponents.weekday == 3) result = @"Вт";
    if ( dateComponents.weekday == 4) result = @"Ср";
    if ( dateComponents.weekday == 5) result = @"Чт";
    if ( dateComponents.weekday == 6) result = @"Пт";
    if ( dateComponents.weekday == 7) result = @"Сб";
    if ( dateComponents.weekday == 8) result = @"Вс";
//    if ( dateComponents.day > 31) result = nil;


    return result;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar * currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateDay = [currentCalendar components:NSCalendarUnitDay fromDate: date];
    NSDateComponents *dateMonth = [currentCalendar components:NSCalendarUnitMonth fromDate: date];
    NSDateComponents *dateYear = [currentCalendar components:NSCalendarUnitYear fromDate: date];
    
    if (((int)dateDay >= 17 && (int)dateMonth == 5 && (int)dateYear == 2021) || ((int)dateDay <= 23 && (int)dateMonth == 5 && (int)dateYear == 2021)) return YES;
    else return NO;
}

@end
