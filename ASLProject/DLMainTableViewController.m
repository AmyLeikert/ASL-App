//
//  DLMainTableViewController.m
//  ASLProject
//
//  Created by DetroitLabsUser on 3/28/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "DLMainTableViewController.h"
#import "DLFingerspellingViewController.h"

static NSString * const kCellReuseIdentifier = @"cellIdentifier";

@implementation DLMainTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
       
    self.title = @"American Sign Language";
    
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseIdentifier];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    
    return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"tableList" ofType:@"plist"];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    return [dictionary count];
    
//    NSInteger numberOfSections = 3;
//    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"tableList" ofType:@"plist"];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *asl = dictionary[@"American Sign Language"];
    NSArray *swedish = dictionary[@"Swedish"];
    NSArray *japanese = dictionary[@"Japanese"];
    
    
    
    switch (section) {
        case 0:
            // numberOfRows = 2;
            numberOfRows = [asl count];
            break;
        case 1:
            //numberOfRows = 1;
            numberOfRows = [swedish count];
            break;
        case 2:
            // numberOfRows = 4;
            numberOfRows = [japanese count];
            break;
        default:
            numberOfRows = 0;
            break;
    }
    return numberOfRows;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *titleForHeader;
    titleForHeader = @"Amys App";
    switch (section) {
        case 0:
            titleForHeader = @"American Sign Language";
            break;
        case 1:
            titleForHeader = @"Svenska";
           break;
        case 2:
            titleForHeader = @"日本語";
            break;
        default:
            titleForHeader = @"X";
            break;
    }
    
    
    return titleForHeader;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];

    cell.textLabel.text = @"Fingerspelling";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DLFingerspellingViewController *fingerspellingViewController = [[DLFingerspellingViewController alloc] init];
    
    [self.navigationController pushViewController:fingerspellingViewController animated:YES];
}

@end

