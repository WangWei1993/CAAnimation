//
//  NSCalendar+WWAdd.m
//  核心动画
//
//  Created by 王伟 on 2017/4/24.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "NSCalendar+WWAdd.h"

// static NSDateComponents *_dateComponents;

@implementation NSCalendar (WWAdd)

+ (NSInteger)currentYear {
    
    NSDateComponents *cmps = [NSCalendar currentComponents];
    return cmps.year;
}

+ (NSInteger)currentMonth {
   
    NSDateComponents *cmps = [NSCalendar currentComponents];
    return cmps.month;
}

+ (NSInteger)currentDay {
    
    NSDateComponents *cmps = [NSCalendar currentComponents];
    return cmps.day;
}

+ (NSInteger)currentMinute {
    
    NSDateComponents *cmps = [NSCalendar currentComponents];
    return cmps.minute;
}

+ (NSInteger)currentSecond {
    
    NSDateComponents *cmps = [NSCalendar currentComponents];
    return cmps.second;
}

+ (NSDateComponents *)currentComponents {
    // 获取当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 从距离现在时间的年、月、日、时、分、秒
    /*
     NSCalendarUnitYear               = kCFCalendarUnitYear,
     NSCalendarUnitMonth              = kCFCalendarUnitMonth,
     NSCalendarUnitDay                = kCFCalendarUnitDay,
     NSCalendarUnitHour               = kCFCalendarUnitHour,
     NSCalendarUnitMinute             = kCFCalendarUnitMinute,
     NSCalendarUnitSecond             = kCFCalendarUnitSecond,
     */
    NSDateComponents *cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour| NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    
     return cmps;
}

@end
