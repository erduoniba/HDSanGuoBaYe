//
//  MSBaseWebViewController.h
//  MSToshiba
//
//  Created by 邓立兵 on 2017/12/25.
//  Copyright © 2017年 Midea. All rights reserved.
//

#import <HDBaseProject/HDBaseProject.h>

@class RootViewController;

@interface MSBaseWebViewController : TOWebViewController

@property (nonatomic, assign) RootViewController *weakVC;

- (instancetype)initWithFileName:(NSString *)fileName;

@end
