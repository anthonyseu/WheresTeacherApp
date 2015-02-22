//
//  Teacher.m
//  WheresTeacher
//
//  Created by Shangqing Zhang on 2/19/15.
//  Copyright (c) 2015 yahoo. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"Name"];
        self.city = dictionary[@"City"];
        self.state = dictionary[@"State"];
        self.zip = dictionary[@"Zip"];
        self.profileImageUrl = dictionary[@"TutorPictures"];
        self.feePerHour = [dictionary[@"FeePerHour"] integerValue];
        self.profileLink = dictionary[@"ProfileLink"];
        self.subjects = dictionary[@"Subjects"];
    }
    return self;

}

+ (NSArray *)teachersWithDictionaries:(NSArray *)dictionaries {
    NSMutableArray *teachers = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Teacher *teacher =[[Teacher alloc] initWithDictionary:dictionary];
        [teachers addObject:teacher];
    }
    return teachers;
}
@end
