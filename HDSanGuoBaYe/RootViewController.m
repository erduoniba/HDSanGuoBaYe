//
//  ViewController.m
//  Hotchpotch
//
//  Created by Harry on 15/6/25.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "RootViewController.h"

#import "HDWKWebViewViewController.h"
#import "HDWKWebViewViewController.h"

#import <HDBaseProject/HDBaseProject.h>

@interface RootViewController ()

@property (nonatomic, strong) HDWKWebViewViewController  *boxesCloudVC;
@property (nonatomic, strong) HDWKWebViewViewController  *findSomeVC;
@property (nonatomic, strong) HDWKWebViewViewController  *settingVC;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.penroseView setLeftColor:[UIColor colorWithRed:0.907806F green:0.922750F blue:0.919288F alpha:0.97F]];
    [self.penroseView setRightColor:[UIColor colorWithRed:0.907806F green:0.922750F blue:0.919288F alpha:0.97F]];
    [self.penroseView setTopColor:[UIColor colorWithRed:0.907806F green:0.922750F blue:0.919288F alpha:0.97F]];
    [self.penroseView setColorSelectedSide:YES];
    [self.penroseView setSelectColor:[UIColor colorWithRed:0.874510F green:0.945098F blue:0.929412F alpha:0.97F]];
    
    [self addButtonsToTop:@"群魔乱舞-乱战三国" left:@"群魔乱舞-血色华夏" right:@"群魔乱舞-三国杀"];
    [self setMainController:self.boxesCloudVC];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setSide:RSPenroseSideAppearTop];
}


#pragma mark - 成员变量延迟实例化
- (HDWKWebViewViewController *)boxesCloudVC{
    if (!_boxesCloudVC) {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSString *name = [@"群魔乱舞-乱战三国" hd_utf8Encode];
        NSString *url = [NSString stringWithFormat:@"https://bgwp.oschina.io/baye/m.html?name=%@#%0.3f", name, now];
        _boxesCloudVC = [[HDWKWebViewViewController alloc] initWithURLString:url];
        _boxesCloudVC.weakVC = self;
    }
    return _boxesCloudVC;
}

- (HDWKWebViewViewController *)findSomeVC{
    if (!_findSomeVC) {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSString *name = [@"群魔乱舞-血色华夏" hd_utf8Encode];
        NSString *url = [NSString stringWithFormat:@"https://bgwp.oschina.io/baye/m.html?name=%@#%0.3f", name, now];
        _findSomeVC = [[HDWKWebViewViewController alloc] initWithURLString:url];
        _findSomeVC.weakVC = self;
    }
    return _findSomeVC;
}

- (HDWKWebViewViewController *)settingVC{
    if (!_settingVC) {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSString *name = [@"群魔乱舞-三国杀" hd_utf8Encode];
        NSString *url = [NSString stringWithFormat:@"https://bgwp.oschina.io/baye/m.html?name=%@#%0.3f", name, now];
        _settingVC = [[HDWKWebViewViewController alloc] initWithURLString:url];
        _settingVC.weakVC = self;
    }
    return _settingVC;
}


#pragma mark - RSPenroseViewController Delegate
-(void)didSelectPenroseButtonAtIndex:(int)index{
    switch (index) {
        case 0:{
            [self setMainController:self.boxesCloudVC];
            [self.penroseView selectSide:0];
            break;
        }
            
        case 1:{
            [self setMainController:self.findSomeVC];
            [self.penroseView selectSide:1];
            break;
        }
            
        case 2:{
            [self setMainController:self.settingVC];
            [self.penroseView selectSide:2];
            break;
        }
            
        default:
            break;
    }
}

-(void)didShowPenrose{
    NSLog(@"Penrose Did Show");
}

-(void)didHidePenrose{
    NSLog(@"Penrose Did Hide");
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
