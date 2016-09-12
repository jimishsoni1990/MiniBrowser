//
//  WebViewOprations.m
//  MiniBrowser
//
//  Created by Jimish Soni on 09/09/16.
//  Copyright © 2016 Jimish Soni. All rights reserved.
//

#import "WebViewOprations.h"



@implementation WebViewOprations

- (BOOL)isValidURL:(NSString*)url {
    NSUInteger length = [url length];
    // Empty strings should return NO
    if (length > 0) {
        NSError *error = nil;
        NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:&error];
        if (dataDetector && !error) {
            NSRange range = NSMakeRange(0, length);
            NSRange notFoundRange = (NSRange){NSNotFound, 0};
            NSRange linkRange = [dataDetector rangeOfFirstMatchInString:url options:0 range:range];
            if (!NSEqualRanges(notFoundRange, linkRange) && NSEqualRanges(range, linkRange)) {
                return YES;
            }
        }
        else {
            NSLog(@"Could not create link data detector: %@ %@", [error localizedDescription], [error userInfo]);
        }
    }
    return NO;
}

-(NSURLRequest*)loadWebViewForURL: (NSString*) url{
    
    if([self isValidURL:url]){
    
        NSURL * webAddress = [NSURL URLWithString:url];
        NSURLRequest * webPage = [NSURLRequest requestWithURL:webAddress];
        return webPage;
        
    } else {
        
        NSMutableString *searchText = [[NSMutableString alloc] initWithString:@"https://www.google.com/#q="];
        [searchText appendString:[url stringByReplacingOccurrencesOfString:@" " withString:@"+"]];
        
        NSURL * webAddress = [NSURL URLWithString:searchText];
        NSURLRequest * webPage = [NSURLRequest requestWithURL:webAddress];
        
        return webPage;
    }
    
}

-(void) saveHistory: (NSDictionary*) urlInfo{
    
    NSMutableArray * history;
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"webViewHistory"]){
        
        history = [[[NSUserDefaults standardUserDefaults] objectForKey:@"webViewHistory"]mutableCopy];
        [history addObject:urlInfo];
        [[NSUserDefaults standardUserDefaults] setObject:history forKey:@"webViewHistory"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    } else {
        
        history = [[NSMutableArray alloc] init];
        [history addObject:urlInfo];
        [[NSUserDefaults standardUserDefaults] setObject:history forKey:@"webViewHistory"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
}

@end