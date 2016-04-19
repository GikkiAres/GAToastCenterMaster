//
//  GAToastStyle.m
//  GAToast-Master
//
//  Created by oftenfull on 16/3/29.
//  Copyright © 2016年 GikkAres. All rights reserved.
//

#import "GAToastStyleConfig.h"

@implementation GAToastStyleConfig

+ (instancetype)defaultConfig {
  //为什么这里不能写init呢?因为在init函数后面加了NS_UNAVAILABLE
  GAToastStyleConfig *_defaultConfig = [[GAToastStyleConfig alloc]init];
  if (_defaultConfig) {
    _defaultConfig.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.8];
    _defaultConfig.titleColor = [UIColor whiteColor];
    _defaultConfig.messageColor = [UIColor whiteColor];
    _defaultConfig.maxWidthPercentage = 0.8;
    _defaultConfig.maxHeightPercentage = 0.8;
    _defaultConfig.horizontalPadding = 10.0;
    _defaultConfig.verticalPadding = 10.0;
    _defaultConfig.cornerRadius = 10.0;
    _defaultConfig.titleFont = [UIFont boldSystemFontOfSize:16.0];
    _defaultConfig.messageFont = [UIFont systemFontOfSize:16.0];
    _defaultConfig.titleAlignment = NSTextAlignmentLeft;
    _defaultConfig.messageAlignment = NSTextAlignmentLeft;
    _defaultConfig.titleNumberOfLines = 0;
    _defaultConfig.messageNumberOfLines = 0;
    _defaultConfig.displayShadow = NO;
    _defaultConfig.shadowOpacity = 0.8;
    _defaultConfig.shadowRadius = 6.0;
    _defaultConfig.shadowOffset = CGSizeMake(4.0, 4.0);
    _defaultConfig.imageSize = CGSizeMake(80.0, 80.0);
    _defaultConfig.activitySize = CGSizeMake(100.0, 100.0);
    _defaultConfig.fadeDuration = 0.2;
    //
//    _defaultConfig.tapToDismissEnabled = YES;
//    _defaultConfig.queueEnabled = YES;
//    _defaultConfig.defaultDuration = 3.0;
//    _defaultConfig.defaultPosition = CSToastPositionBottom;
    
  }
  return _defaultConfig;
}


@end
