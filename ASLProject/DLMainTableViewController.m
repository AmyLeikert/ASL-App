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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
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

