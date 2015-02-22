//
//  WyzAntClient.m
//  WheresTeacher
//
//  Created by Li Jiao on 2/21/15.
//  Copyright (c) 2015 yahoo. All rights reserved.
//

#import "WyzAntClient.h"

NSString const *apiKey = @"f9397524-c1fa-4758-b4c7-799ab2a67cb3";

@implementation WyzAntClient

+ (WyzAntClient *)sharedInstance {
    static WyzAntClient *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[WyzAntClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://data.wyzant.com/api/"]];
        }
    });
    return instance;
}

- (AFHTTPRequestOperation *)searchTeachers:(NSDictionary *)params success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSString *paramsUrl = [self dictionaryToUrlParams:params];
    NSString *postUrl = [NSString stringWithFormat:@"search?%@=%@&%@", @"PartnerAPIKey", apiKey, paramsUrl];
    
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    return [self GET:postUrl parameters:nil success:success failure:failure];
}

#pragma mark - url utils
- (NSString *)dictionaryToUrlParams:(NSDictionary *)dictionary {
    NSMutableArray *paramsArray = [[NSMutableArray alloc] init];
    for (NSString *key in dictionary) {
        NSString *value = [dictionary objectForKey:key];
        if (value.length > 0) {
            NSString *param = [NSString stringWithFormat:@"%@=%@", key, value];
            [paramsArray addObject:param];
        }
    }
    NSString *paramsUrl = [paramsArray componentsJoinedByString:@"&"];
    return paramsUrl;
}

@end
