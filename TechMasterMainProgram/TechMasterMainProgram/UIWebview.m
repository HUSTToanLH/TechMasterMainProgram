//
//  UIWebview.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 9/18/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.

#import "UIWebview.h"
#import "HTMLReader.h"

#define link @"https://www.facebook.com/profile.php?id=100001777967159"
#define link2 @"http://www.24h.com.vn"
@interface UIWebview ()

@end

@implementation UIWebview{
    UIWebView *_webView;
    NSMutableData *responseData;
    NSURLConnection *theConnection;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *URL = [NSURL URLWithString:link2];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:URL completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          NSString *contentType = nil;
          if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
              NSDictionary *headers = [(NSHTTPURLResponse *)response allHeaderFields];
              contentType = headers[@"Content-Type"];
          }
          HTMLDocument *home = [HTMLDocument documentWithData:data
                                            contentTypeHeader:contentType];
          HTMLElement *div = [home firstNodeMatchingSelector:@".repository-description"];
          NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
          NSLog(@"%@", [div.textContent stringByTrimmingCharactersInSet:whitespace]);
          // => A WHATWG-compliant HTML parser in Objective-C.
      }] resume];

}
@end
