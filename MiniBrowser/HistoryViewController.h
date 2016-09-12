//
//  HistoryViewController.h
//  MiniBrowser
//
//  Created by Jimish Soni on 09/09/16.
//  Copyright © 2016 Jimish Soni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *historyTable;
@property (strong, nonatomic) NSArray * historyData; 

@end
