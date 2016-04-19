//
//  GAToastCenter.m
//  GAToast-Master
//
//  Created by oftenfull on 16/3/29.
//  Copyright © 2016年 GikkAres. All rights reserved.
//

#import "GAToastCenter.h"
#import "GAToastStyleConfig.h"
#import <objc/runtime.h>

// Keys for values associated with window
@interface GAToastCenter ()

@property (nonatomic,strong) UIView *viewIndicator;
@property (nonatomic,strong) UIView *viewMain;
@property (nonatomic,strong) UIWindow *window;
@property (nonatomic,assign) BOOL bToasting;

@property (nonatomic,strong) GAToastStyleConfig *styleConfig;

@property (assign, nonatomic, getter=isTapToDismissEnabled) BOOL tapToDismissEnabled;
@property (assign, nonatomic, getter=isQueueEnabled) BOOL queueEnabled;
@property (assign, nonatomic) NSTimeInterval defaultDuration;
@property (strong, nonatomic) id defaultPosition;

@end

@implementation GAToastCenter

#pragma mark - 1 系统流程
+ (instancetype)defaultCenter {
  static GAToastCenter *_defaultCenter;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _defaultCenter = [[GAToastCenter alloc]init];
  });
  return _defaultCenter;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.bToasting = NO;
    _window = [UIApplication sharedApplication].keyWindow;
    _styleConfig = [GAToastStyleConfig defaultConfig];
  }
  return self;
}

#pragma mark - 2 主要基本函数
#pragma mark 2.1 直接待调用函数
- (void)beginToast{
//如果正在显示,直接返回
  if (_bToasting) return;
  _bToasting = YES;
  _viewMain = [[UIView alloc]initWithFrame:_window.bounds];
  [_window addSubview:_viewMain];
  //加载默认的指示器
  [self loadDefaultIndicatorView];
  
}

- (void)loadDefaultIndicatorView {
  _viewIndicator = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, _styleConfig.activitySize.width, _styleConfig.activitySize.height)];
  _viewIndicator.center = _window.center;
  _viewIndicator.backgroundColor = _styleConfig.backgroundColor;
  _viewIndicator.alpha = 0.0;
  _viewIndicator.layer.cornerRadius = _styleConfig.cornerRadius;
  if (_styleConfig.displayShadow) {
    _viewIndicator.layer.shadowColor = _styleConfig.shadowColor.CGColor;
    _viewIndicator.layer.shadowOpacity = _styleConfig.shadowOpacity;
    _viewIndicator.layer.shadowRadius = _styleConfig.shadowRadius;
    _viewIndicator.layer.shadowOffset = _styleConfig.shadowOffset;
  }
  [_viewMain addSubview:_viewIndicator];
  
  
  UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  indicatorView.center = CGPointMake(_viewIndicator.frame.size.width/2, _viewIndicator.frame.size.height/2);
  [_viewIndicator addSubview:indicatorView];
  [indicatorView startAnimating];
  
  
  [UIView animateWithDuration:_styleConfig.fadeDuration
                        delay:0.0
                      options:UIViewAnimationOptionCurveEaseOut
                   animations:^{
                     _viewIndicator.alpha = 1.0;
                   } completion:nil];
}

- (void)endToast {
  if (!_bToasting) return;
  _bToasting = NO;
  [UIView animateWithDuration:_styleConfig.fadeDuration
                        delay:0.0
                      options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                   animations:^{
                     _viewIndicator.alpha = 0.0;
                   } completion:^(BOOL finished) {
                     [_viewMain removeFromSuperview];
                     _viewMain = nil;
                   }];
}

#pragma mark 2.2 工具函数
//- (CGPoint)cs_centerPointForPosition:(id)point withToast:(UIView *)toast {
//  CSToastStyle *style = [CSToastManager sharedStyle];
//  
//  if([point isKindOfClass:[NSString class]]) {
//    if([point caseInsensitiveCompare:CSToastPositionTop] == NSOrderedSame) {
//      return CGPointMake(self.bounds.size.width/2, (toast.frame.size.height / 2) + _styleConfig.verticalPadding);
//    } else if([point caseInsensitiveCompare:CSToastPositionCenter] == NSOrderedSame) {
//      return CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
//    }
//  } else if ([point isKindOfClass:[NSValue class]]) {
//    return [point CGPointValue];
//  }
//  
//  // default to bottom
//  return CGPointMake(self.bounds.size.width/2, (self.bounds.size.height - (toast.frame.size.height / 2)) - _styleConfig.verticalPadding);
//}

@end
