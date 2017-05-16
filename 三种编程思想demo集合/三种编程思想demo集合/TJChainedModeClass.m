//
//  TJChainedModeClass.m
//  三种编程思想demo集合
//
//  Created by TanJian on 17/5/16.
//  Copyright © 2017年 Joshpell. All rights reserved.
//

#import "TJChainedModeClass.h"

@implementation TJChainedModeClass

//由于.h文件中使用了readonly，所以.m中需要使用属性时需要先手动加getter生成器，如下
@synthesize addAge = _addAge;
@synthesize addName = _addName;
@synthesize addHeadImg = _addHeadImg;
@synthesize addNickname = _addNickname;
@synthesize addAll = _addAll;

-(configerString)addName{
    
    //防止重复赋值
    if (!_addName) {
        
        __weak typeof(self) weakSelf = self;
        return ^(NSString *string){
            
            weakSelf.name = string;
            return weakSelf;
        };
    }
    
    return _addName;
}

-(configerString)addNickname{
    
    if (!_nickname) {
        __weak typeof(self) weakSelf = self;
        return ^(NSString *string){
            
            weakSelf.nickname = string;
            return weakSelf;
        };
    }
    return _addNickname;
}

-(configerInteger)addAge{
    
    if (!_addAge) {
        __weak typeof(self) weakSelf = self;
        return ^(NSInteger num){
            
            weakSelf.age = num;
            return weakSelf;
        };
    }
    return _addAge;
    
}

-(configerObject)addHeadImg{
    
    if (!_addHeadImg) {
        __weak typeof(self) weakSelf = self;
        return ^(UIImage *image){
            
            weakSelf.headImg = image;
            return weakSelf;
        };
    }
    return _addHeadImg;
}

-(configerAll)addAll{
    
    if (!_addAll) {
        __weak typeof(self) weakSelf = self;
        return ^(NSString *name,NSString *nickName,NSInteger age,UIImage *image){
            
            weakSelf.name = name;
            weakSelf.nickname = nickName;
            weakSelf.age = age;
            weakSelf.headImg = image;
            return weakSelf;
        };
    }
    return _addAll;
}


@end
