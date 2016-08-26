//
//  DKCustomTableViewController.m
//  DKAnimation
//
//  Created by NaCai on 16/8/26.
//  Copyright © 2016年 qiang zhai. All rights reserved.
//

#import "DKCustomTableViewController.h"
#import "DKMacros.h"

@interface DKCustomTableViewController ()
@property (nonatomic, strong) NSArray *lists;
@end

@implementation DKCustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    self.lists = @[
                   @{kDescription:@"Custom Property",kClassName:@"DKCustomPropertyScene"},
                   @{kDescription:@"Fly In",kClassName:@"DKFlyInScene"},
                   @{kDescription:@"PopUp",kClassName:@"DKPopUpScene"},
                    @{kDescription:@"Decay Move",kClassName:@"DKDecayMoveScene"},
            @{kDescription:@"Transform",kClassName:@"DKTransformScene"}
                   ];
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.lists[(NSUInteger)indexPath.row][kDescription];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = [self.lists[(NSUInteger)indexPath.row] objectForKey:kClassName];
    UIViewController *viewController = [(UIViewController *)[NSClassFromString(className) alloc] initWithNibName:className bundle:nil];
    viewController.title = self.lists[(NSUInteger)indexPath.row][kDescription];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
