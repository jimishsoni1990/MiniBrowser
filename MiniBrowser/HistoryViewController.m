//
//  HistoryViewController.m
//  MiniBrowser
//
//  Created by Jimish Soni on 09/09/16.
//  Copyright © 2016 Jimish Soni. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
    
    
    self.historyData = [[NSUserDefaults standardUserDefaults] objectForKey:@"webViewHistory"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.historyData.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"historyCell"];
    
    NSDictionary * data = [self.historyData objectAtIndex:indexPath.row];
    
    NSString * address = [data valueForKey:@"address"];
    
    NSURL *myURL=[NSURL URLWithString: address];
    NSData *myData=[NSData dataWithContentsOfURL:myURL];
    
    UIImage *myImage=[[UIImage alloc] initWithData:myData];
    
    cell.textLabel.text = [data valueForKey:@"title"];
    cell.detailTextLabel.text = address;
    
    cell.imageView.image = myImage;
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary * data = [self.historyData objectAtIndex:indexPath.row];
    
    NSURL * url = [NSURL URLWithString:[data valueForKey:@"address"]];
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    
    
}

- (IBAction)dismissHistoryModal:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)clearHistory:(id)sender {
}

@end
