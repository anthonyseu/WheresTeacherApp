//
//  WyzAntClient.h
//  WheresTeacher
//
//  Created by Li Jiao on 2/21/15.
//  Copyright (c) 2015 yahoo. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "Teacher.h"

@interface WyzAntClient : BDBOAuth1RequestOperationManager

+ (WyzAntClient *)sharedInstance;

- (AFHTTPRequestOperation *)searchTeachers:(NSDictionary *)params success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
