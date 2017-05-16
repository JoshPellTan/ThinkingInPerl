//
//  ViewController.m
//  三种编程思想demo集合
//
//  Created by TanJian on 17/5/16.
//  Copyright © 2017年 Joshpell. All rights reserved.
//

#import "ViewController.h"
#import "TJChainedModeClass.h"
#import "TJFunctionalProgrammingClass.h"
#import "TJReactiveProgrammingClass.h"



@interface ViewController ()

@property (nonatomic, strong) TJReactiveProgrammingClass *reactObj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self chainedModelFunction];//链式编程
    
//    [self functionalProgramming];//函数式编程
    
    [self reactProgramming];//响应式编程
    
}

/*
 链式编程思想：是将多个操作（多行代码）通过点号(.)链接在一起成为一句代码,使代码可读性好。a(1).b(2).c(3)
 
 链式编程特点：方法的返回值是block,block必须有返回值（本身对象），block参数（需要操作的值）
 
 代表：masonry框架、SDAutoLayout框架。
 */
-(void)chainedModelFunction{
    
    TJChainedModeClass *chainedMode1 = [TJChainedModeClass new];
    chainedMode1.addName(@"jackson").addNickname(@"josh").addAge(5).addHeadImg(nil);
    NSLog(@"chainedMode1---%@",chainedMode1);
    
    TJChainedModeClass *chainedMode2 = [TJChainedModeClass new];
    chainedMode2.addAll(@"jackson",@"josh",5,nil);
    NSLog(@"chainedMode2---%@",chainedMode2);
}

/*
 函数式编程本质:不想把一些属性暴露给外部，就是往方法中传入Block,方法中嵌套Block调用，把代码聚合起来管理,
 
 函数式编程特点：每个方法必须有返回值（本身对象）,把函数或者Block当做参数,block参数（需要操作的值）block返回值（操作结果）
 
 代表：Masonry、ReactiveCocoa(也做函数响应式编程)。
 */
-(void)functionalProgramming{
    
    NSString *str = [TJFunctionalProgrammingClass makeTool:^(TJFunctionalProgrammingClass *tool) {
       
        tool.FunctionalAction(@[@"张三",@"李四",@"王五"]);
        
    }];
    
    
    NSLog(@"functionalProgramming----%@",str);
    
}

/*响应式编程思想--模拟KVO实现
 响应式编程思想：不需要考虑调用顺序，只需要知道考虑结果，类似于蝴蝶效应，产生一个事件，会影响很多东西，这些事件像流一样的传播出去，然后影响结果，借用面向对象的一句话，万物皆是流。
 
 代表：KVO运用,RAC则涉及更加广泛
 */
-(void)reactProgramming{
    
    //类中的reactNum数值发生变化时，会调用打印方法
    TJReactiveProgrammingClass *reactObj = [TJReactiveProgrammingClass new];
    _reactObj = reactObj;
    
    //[reactObj TJ_addObserver:self forKeyPath:@"reactNum" options:NSKeyValueObservingOptionNew  context:nil];
    reactObj.reactBlock = ^(int normalNum,int reactNum){
        
        NSLog(@"normalNum:%d----reactNum:%d",normalNum,reactNum);
        
    };
}

//点击测试效果
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _reactObj.reactNum = arc4random() % 100;//改变时会响应
    
    //_reactObj.normalNum = arc4random() % 100;//改变时不会响应
}


@end





