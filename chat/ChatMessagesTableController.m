//
//  ChatMessagesTableController.m
//  chat
//
//  Created by Andrew Breja on 4/9/13.
//
//

#import "ChatMessagesTableController.h"

@implementation ChatMessagesTableController
{
    NSMutableArray *tableData;
}

- (void)initialSetup
{
    tableData = [NSMutableArray new];
    
    [tableData addObject:@"one"];
    [tableData addObject:@"two"];
    [tableData addObject:@"three"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

@end
