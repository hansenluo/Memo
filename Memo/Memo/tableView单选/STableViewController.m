//
//  STableViewController.m
//  Memo
//
//  Created by 罗世权 on 2019/3/26.
//  Copyright © 2019年 hansen. All rights reserved.
//

#import "STableViewController.h"

@interface STableViewController (){
    NSMutableArray *tagArray;
}

@end

@implementation STableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tagArray = [[NSMutableArray alloc] initWithCapacity:30];
    for (int i = 0; i < 30; i++) {
        [tagArray addObject:@"0"];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_id = @"cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    if ([tagArray[indexPath.row] isEqualToString:@"0"]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.checkBtn.selected = NO;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
       // cell.checkBtn.selected = YES;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if ([tagArray[indexPath.row] isEqualToString:@"0"]) {
        
        NSInteger number = tagArray.count;
        [tagArray removeAllObjects];
        for (int i = 0; i < number; i++) {
            [tagArray addObject:@"0"];
        }
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [tagArray replaceObjectAtIndex:indexPath.row withObject:@"1"];
        
        [tableView reloadData];
    } else if ([tagArray[indexPath.row] isEqualToString:@"1"]) {
        
        [tagArray replaceObjectAtIndex:indexPath.row withObject:@"0"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

@end
