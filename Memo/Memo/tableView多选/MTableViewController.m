//
//  MTableViewController.m
//  Memo
//
//  Created by 罗世权 on 2019/5/16.
//  Copyright © 2019年 dachen. All rights reserved.
//

#import "MTableViewController.h"

@interface MTableViewController (){
    NSMutableArray *_selectIndexArray;
    BOOL deleteElemnet;
}

@end

@implementation MTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _selectIndexArray = [[NSMutableArray alloc] initWithCapacity:1];
}

#pragma mark - Table view data source
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
    
    if([_selectIndexArray containsObject:indexPath]){
        //cell.checkBtn.selected = YES;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        //cell.checkBtn.selected = NO;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (_selectIndexArray.count == 0) {
        [_selectIndexArray addObject:indexPath];
//        cell.checkBtn.selected = YES;
//        [_selectModelArray addObject:cell.groupListModel];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        for (int a = 0 ; a < _selectIndexArray.count ; a++) {
            //deleteElemnet = YES;
            if ([_selectIndexArray[a] isEqual:indexPath]) {
                [_selectIndexArray removeObject:indexPath];
                //[_selectModelArray removeObject:cell.groupListModel];
                deleteElemnet = NO;
                //cell.checkBtn.selected = NO;
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
        
        if (deleteElemnet == YES) {
            [_selectIndexArray addObject:indexPath];
            //[_selectModelArray addObject:cell.groupListModel];
            deleteElemnet = NO;
            //cell.checkBtn.selected = YES;
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    deleteElemnet = YES;
}

@end
