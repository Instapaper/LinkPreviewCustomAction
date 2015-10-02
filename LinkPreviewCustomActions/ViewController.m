//
//  ViewController.m
//  LinkPreviewCustomActions
//
//  Created by Brian Donohue on 10/2/15.
//  Copyright © 2015 Instapaper Holdings, Inc. All rights reserved.
//

#import "ViewController.h"
@import WebKit;

@interface ViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    self.webView.frame = self.view.bounds;
    [self.view addSubview:self.webView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://blog.instapaper.com/post/129227268641"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.allowsLinkPreview = YES;
    }
    
    return _webView;
}

@end
