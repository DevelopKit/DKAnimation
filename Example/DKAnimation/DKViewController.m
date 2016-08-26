//
//  DKViewController.m
//  DKAnimation
//
//  Created by qiang zhai on 08/23/2016.
//  Copyright (c) 2016 qiang zhai. All rights reserved.
//

#import "DKViewController.h"
#import "DKMacros.h"

@interface DKViewController ()
@property(nonatomic, copy) NSArray *lists;
@end

@implementation DKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"POP";
    self.lists = @[
            @{kDescription:@"Basic",kClassName:@"DKBasicTableViewController"},
            @{kDescription:@"Spring",kClassName:@"DKSpringTableViewController"},
            @{kDescription:@"Decay",kClassName:@"DKDecayTableViewController"},
            @{kDescription:@"Custom",kClassName:@"DKCustomTableViewController"}
    ];

}

#pragma mark - UITableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.lists[(NSUInteger)indexPath.row][kDescription];
    return cell;
}

#pragma mark  - UITableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *className = [self.lists[(NSUInteger)indexPath.row] objectForKey:kClassName];
    UIViewController *viewController = [(UIViewController *)[NSClassFromString(className) alloc] init];
    viewController.title = self.lists[(NSUInteger)indexPath.row][kDescription];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
