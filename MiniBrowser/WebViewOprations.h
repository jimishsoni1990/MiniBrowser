//
//  WebViewOprations.h
//  MiniBrowser
//
//  Created by Jimish Soni on 09/09/16.
//  Copyright © 2016 Jimish Soni. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WebViewOprations : NSObject
@property (strong, nonatomic) NSString * urlString;
@property (strong, nonatomic) NSMutableDictionary * historyDict;


// Methods
-(NSURLRequest*)loadWebViewForURL: (NSString*) url;
-(void) saveHistory: (NSDictionary*) urlInfo;
@end
