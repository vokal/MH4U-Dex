//
//  UITableViewController+HeaderFooterChanger.m
//  
//
//  Created by Joseph Goldberg on 4/1/15.
//
//

#import "UITableViewController+HeaderFooterChanger.h"

@implementation UITableViewController (HeaderFooterChanger)

- (void)mhd_changeHeaderFooterForArray:(NSArray *)array
{
    if (array.count) {
        // The tableHeaderView is only used to display a message if there are no contents in the tableView.
        self.tableView.tableHeaderView = nil;
    } else {
        self.tableView.tableFooterView = [UIView new];
    }
}

@end
