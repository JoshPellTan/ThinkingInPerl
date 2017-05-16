//
//  TJReactiveProgrammingClass.h
//  三种编程思想demo集合
//
//  Created by TanJian on 17/5/16.
//  Copyright © 2017年 Joshpell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJReactiveProgrammingClass : UIView

@property (nonatomic, assign) int reactNum;
@property (nonatomic, assign) int normalNum;

@property (nonatomic, copy) void (^reactBlock)(int num1,int num2);

@end
