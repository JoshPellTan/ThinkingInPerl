//
//  TJFunctionalProgrammingClass.m
//  三种编程思想demo集合
//
//  Created by TanJian on 17/5/16.
//  Copyright © 2017年 Joshpell. All rights reserved.
//

#import "TJFunctionalProgrammingClass.h"


@interface TJFunctionalProgrammingClass ()

@property (nonatomic, copy) NSString *finalString;//不必要的属性不需要暴露给外部

@end

@implementation TJFunctionalProgrammingClass

+(NSString *)makeTool:(void (^)(TJFunctionalProgrammingClass *tool))block{
    
    if (block) {
        TJFunctionalProgrammingClass *tool = [[TJFunctionalProgrammingClass alloc]init];
        
        block(tool);
        
        return tool.finalString;
    }
    
    return nil;
}

-(Function)FunctionalAction{
    
    __weak typeof(self) weakself = self;
    return ^(NSArray<NSString *> *strings ){
        
        if (strings.count>0) {
            weakself.finalString = [NSString stringWithFormat:@"FunctionalProgramming + %@",[strings componentsJoinedByString:@"-"]];
        }else{
            weakself.finalString = @"FunctionalProgramming + nil";
        }
        
        return weakself;
    };
}


@end
