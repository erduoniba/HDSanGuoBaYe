//
//  HDWKWebViewViewController.h
//  HDSanGuoBaYe
//
//  Created by 邓立兵 on 2019/11/6.
//  Copyright © 2019年 denglibing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface HDWKWebViewViewController : UIViewController

@property (nonatomic, assign) RootViewController *weakVC;

- (instancetype)initWithURLString:(NSString *)urlString;

@end
