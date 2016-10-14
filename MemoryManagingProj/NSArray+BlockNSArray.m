//
//  NSArray+BlockNSArray.m
//  MemoryManagingProj
//
//  Created by Ленар on 11.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "NSArray+BlockNSArray.h"

@implementation NSArray (BlockNSArray)

-(void)getUniqueArray:(NSArray *)arr withBlock:(void(^)(NSArray* secondArr))completionBlock{
    BOOL dublicat = NO;
    NSMutableArray *arr2 = [NSMutableArray arrayWithArray:self];
    [arr2 addObjectsFromArray:arr];
    NSMutableArray *arr3 = [NSMutableArray new];
    for (int i=0; i<arr2.count; i++){
        for(int j=0; j<arr2.count;j++){
            if(i!=j){
                if([[arr2 objectAtIndex:i]isEqual:[arr2 objectAtIndex:j]]){
                    dublicat = YES;
                }
            }
        }
        if (dublicat!=YES) {
            [arr3 addObject:[arr2 objectAtIndex:i]];
        }
        dublicat = NO;
    }
    completionBlock([NSArray arrayWithArray:arr3]);
}

-(void)replaceObjectAtIndex:(int)index withObjectAtIndex:(int)to withCompletionBlock:(void(^)(NSArray*))completionBlock failureBlock:(void(^)(NSString *error))failure{
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self];
    if(index<arr.count && to<arr.count){
        [arr exchangeObjectAtIndex:index withObjectAtIndex:to];
        completionBlock([NSArray arrayWithArray:arr]);
    }
    failure([NSString stringWithFormat:@"Индекс слишком большой попробуй индекс меньше:%i",(int)arr.count]);
}

-(void)cheakArray:(void(^)(int count, NSString *arrayData))success failureBlock:(void(^)(NSString *error))failure{
    BOOL error = false;
    NSString *successString = @"";
    for(int i=0; i<self.count; i++){
        if(self==nil||[[self objectAtIndex:i]isEqual:[NSNull null]]){
            error = true;
        }
        else{
            successString = [NSString stringWithFormat:@"%@%i:%@",successString,i+1,[self objectAtIndex:i]];
            if(i<self.count-1){
                successString = [NSString stringWithFormat:@"%@,",successString];
            }
        }
    }
    if(error==true){
        failure([NSString stringWithFormat:@"Ошибка! В массиве хранится nil!"]);
    }else{
        success((int)self.count,successString);
    }
}

@end
