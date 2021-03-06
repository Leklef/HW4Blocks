//
//  ViewController.m
//  MemoryManagingProj
//
//  Created by Ildar Zalyalov on 01.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "ViewController.h"
#import "Part2.h"
#import "NSArray+BlockNSArray.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    Part2 *p = [Part2 new];
    [p hello];
    //p.string = @"Goodbye"
    NSLog(@"%@", p.string);
    
    NSArray *array = @[@1,@1,@3,@5,@5,@7,@4,@4,@5,@6,@"hi",@"hi"];
    NSArray *array3 = @[@6,@"hello",@13,@"hi",@6];
    
    [array replaceObjectAtIndex:2 withObjectAtIndex:25 withCompletionBlock:^(NSArray *arr){
        NSLog(@"%@",arr);
    }failureBlock:^(NSString *error) {
        NSLog(@"%@",error);
    }];
    
    [array getUniqueArray:array3 withBlock:^(NSArray *secondArr) {
        NSLog(@"%@",secondArr);
    }];
    
    [array cheakArray:^(int count, NSString *arrayData) {
        NSLog(@"Count:%i \n %@",count,arrayData);
    } failureBlock:^(NSString *error) {
        NSLog(@"%@",error);
    }];
    NSArray *array2 = @[@1,@3,@4,[NSNull null],@5,@9,@"hi",@"hi",@0];
    [array2 cheakArray:^(int count, NSString *arrayData) {
        NSLog(@"Count:%i \n %@",count,arrayData);
    } failureBlock:^(NSString *error) {
        NSLog(@"%@",error);
    }];
    p.notNullInt = 5;
    NSLog(@"%i",p.notNullInt);
    p.notNullInt = -5;
    NSLog(@"%i",p.notNullInt);
}


@end
