//
//  Teacher.h
//  WheresTeacher
//
//  Created by Shangqing Zhang on 2/19/15.
//  Copyright (c) 2015 yahoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zip;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, assign) NSInteger feePerHour;
@property (nonatomic, assign) NSString *profileLink;
@property (nonatomic, strong) NSArray *subjects;

+ (NSArray *)teachersWithDictionaries:(NSArray *)dictionaries;
@end
