//
//  TJChainedModeClass.h
//  三种编程思想demo集合
//
//  Created by TanJian on 17/5/16.
//  Copyright © 2017年 Joshpell. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 链式变成思想,一行代码搞定所有，代码可读性好
 
 特点:链式编程核心是block的返回值是调用者自己
 */
@class TJChainedModeClass;

//命名几个常用的
typedef TJChainedModeClass *(^configerString)(NSString *string);
typedef TJChainedModeClass *(^configerInteger)(NSInteger num);
typedef TJChainedModeClass *(^configerObject)(UIImage *image);
typedef TJChainedModeClass *(^configerAll)(NSString *name,NSString *nickName,NSInteger age,UIImage *image);


@interface TJChainedModeClass : UIView

//链式结构核心代码
@property (nonatomic, copy, readonly) configerString addName;
@property (nonatomic, copy, readonly) configerString addNickname;
@property (nonatomic, copy, readonly) configerInteger addAge;
@property (nonatomic, copy, readonly) configerObject addHeadImg;
@property (nonatomic, copy, readonly) configerAll addAll;

//外部可读的属性
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) UIImage *headImg;


@end

