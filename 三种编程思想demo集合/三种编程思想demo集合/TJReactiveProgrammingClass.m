//
//  TJReactiveProgrammingClass.m
//  三种编程思想demo集合
//
//  Created by TanJian on 17/5/16.
//  Copyright © 2017年 Joshpell. All rights reserved.
//

#import "TJReactiveProgrammingClass.h"


@implementation TJReactiveProgrammingClass

-(instancetype)init{
    self = [super init];
    
    [self addObserver:self forKeyPath:@"reactNum" options:NSKeyValueObservingOptionNew context:nil];
    
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    self.reactBlock(self.normalNum,self.reactNum);
    
}


@end
