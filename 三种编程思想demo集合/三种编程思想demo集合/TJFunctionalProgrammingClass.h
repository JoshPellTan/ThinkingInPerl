//
//  TJFunctionalProgrammingClass.h
//  三种编程思想demo集合
//
//  Created by TanJian on 17/5/16.
//  Copyright © 2017年 Joshpell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJFunctionalProgrammingClass : UIView

//添加方法，参数是一个block，传递一个TJFunctionalProgrammingClass的实例
+ (NSString *)makeTool:(void(^)(TJFunctionalProgrammingClass *tool))block;

//定义一个返回本类实例的函数（block）
typedef TJFunctionalProgrammingClass *(^Function)(NSArray<NSString *> *strings);

@property (nonatomic, strong, readonly) Function FunctionalAction;



@end
