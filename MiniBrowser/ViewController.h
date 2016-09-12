//
//  ViewController.h
//  MiniBrowser
//
//  Created by Jimish Soni on 09/09/16.
//  Copyright © 2016 Jimish Soni. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WebViewOprations;

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *addressBar;
@property (strong, nonatomic) IBOutlet UIWebView *browseArea;
@property (strong, nonatomic) WebViewOprations * webViewOprations;


@end

