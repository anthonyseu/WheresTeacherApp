//
//  FilterViewController.m
//  WheresTeacher
//
//  Created by Shangqing Zhang on 2/19/15.
//  Copyright (c) 2015 yahoo. All rights reserved.
//

#import "FilterViewController.h"
#import "WyzAntClient.h"

@interface FilterViewController ()
@property (nonatomic, weak) NSArray *tutorArray;
@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *params = @{@"Zip": @"94404",
                             @"ResultsFormat": @"JSON"};
    [self fetchTutors:params];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchTutors:(NSDictionary *)params {
    [[WyzAntClient sharedInstance] searchTeachers:params success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"success");
        self.tutorArray = [Teacher teachersWithDictionaries:response];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail: %@", [error localizedDescription]);
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
