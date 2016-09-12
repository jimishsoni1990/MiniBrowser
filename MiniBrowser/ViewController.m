//
//  ViewController.m
//  MiniBrowser
//
//  Created by Jimish Soni on 09/09/16.
//  Copyright © 2016 Jimish Soni. All rights reserved.
//

#import "ViewController.h"
#import "WebViewOprations.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.browseArea.delegate = self;
    self.webViewOprations = [[WebViewOprations alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getValueOfAddressBar:(id)sender {
    
    NSString * address = self.addressBar.text;
    
    [self.browseArea loadRequest:[self.webViewOprations loadWebViewForURL:address]];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *theTitle=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSURL *currentURL = webView.request.mainDocumentURL;
    
    
    NSDictionary * urlInfo = @{ @"title": theTitle, @"address": [currentURL absoluteString]};
    
    [self.webViewOprations saveHistory:urlInfo];
    
    
}

#pragma mark -Footer Buttons






@end
