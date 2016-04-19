//
//  GAToastCenter.h
//  GAToast-Master
//
//  Created by oftenfull on 16/3/29.
//  Copyright © 2016年 GikkAres. All rights reserved.
//

/*
 1 当进行网络请求的时候,增加两个视图:IndicatorView,MaskView.IndicatorView用来指示等待,maskMain用来遮住整个视图,防止用户乱恩.并且承载所有其他的东西.
 2 主视图,加载的主视图试试加在window上?

*/

#import <UIKit/UIKit.h>

@interface GAToastCenter : NSObject

+ (instancetype)defaultCenter;
- (void)beginToast;
- (void)endToast;

@end
