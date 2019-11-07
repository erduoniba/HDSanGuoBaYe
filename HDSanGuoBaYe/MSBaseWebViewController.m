//
//  MSBaseWebViewController.m
//  MSToshiba
//
//  Created by 邓立兵 on 2017/12/25.
//  Copyright © 2017年 Midea. All rights reserved.
//

#import "MSBaseWebViewController.h"

#import "RootViewController.h"

#import <SCCatWaitingHUD/SCCatWaitingHUD.h>

@implementation MSBaseWebViewController {
    NSString *_fileName;
}

- (instancetype)initWithFileName:(NSString *)fileName {
    self = [super init];
    if (self) {
        _fileName = fileName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 加载 webarchive 格式
//    NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_fileName ofType:@"webarchive"]];
//    [self.webView loadData:data MIMEType:@"application/x-webarchive" textEncodingName:@"utf-8" baseURL:[NSURL URLWithString:@"file:///"]];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"lzsg" ofType:@"htm" inDirectory:@"lzsgs"];
//    NSURL *url = [NSURL fileURLWithPath:path];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url] ;
//    [self.webView loadRequest:request];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.webView.opaque = NO;
    self.webView.backgroundColor = [UIColor clearColor];
    
    self.webView.scrollView.scrollEnabled = NO;
    self.navigationButtonsHidden = YES;
    
    
    @weakify(self)
    self.shouldStartLoadRequestHandler = ^BOOL(NSURLRequest *request, UIWebViewNavigationType navigationType) {
        NSLog(@"request.URL.absoluteURL : %@", request.URL.absoluteString);
        @strongify(self)
        if ([request.URL.absoluteString isEqualToString:self.url.absoluteString]) {
            return YES;
        }
        if ([request.URL.absoluteString isEqualToString:@"https://bgwp.oschina.io/baye/index.html"]) {
//            if (self.weakVC) {
//                [self.weakVC showPenroseView];
//            }
        }
        return NO;
    };
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");

    if(![SCCatWaitingHUD sharedInstance].isAnimating) {
        [[SCCatWaitingHUD sharedInstance] animateWithInteractionEnabled:NO];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[SCCatWaitingHUD sharedInstance] stop];
    });
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self createleftBarButtonItemWithImageName:@"public_ic_back"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self createleftBarButtonItemWithImageName:@"public_ic_back"];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.webView.frame = self.view.bounds;
}

- (void)createleftBarButtonItemWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIButton *add_icon = [UIButton buttonWithType:UIButtonTypeCustom];
    add_icon.frame = CGRectMake(0, 0, 44, 44);
    [add_icon setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    [add_icon setImage:image forState:UIControlStateNormal];
    [add_icon addTarget:self action:@selector(leftBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *Item = [[UIBarButtonItem alloc] initWithCustomView:add_icon];
    self.navigationItem.leftBarButtonItem = Item;
}

- (void)leftBarButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
