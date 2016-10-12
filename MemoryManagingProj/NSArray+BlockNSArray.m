//
//  NSArray+BlockNSArray.m
//  MemoryManagingProj
//
//  Created by Ленар on 11.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "NSArray+BlockNSArray.h"

@implementation NSArray (BlockNSArray)

-(void)getUniqueArray:(void(^)(NSArray*))completionBlock{
    BOOL dublicat = NO;
    NSMutableArray *arr2 = [NSMutableArray arrayWithObject:[self objectAtIndex:0]];
    for (int i=0; i<self.count; i++){
        for(int j=0; j<arr2.count;j++){
            if([[self objectAtIndex:i]isEqual:[arr2 objectAtIndex:j]]){
                dublicat = YES;
            }
        }
        if (dublicat!=YES) {
            [arr2 addObject:[self objectAtIndex:i]];
        }
        dublicat = NO;
    }
    completionBlock([NSArray arrayWithArray:arr2]);
}

-(void)replaceObjectAtIndex:(int)index andB:(int)to withCompletionBlock:(void(^)(NSArray*))completionBlock{
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self];
    [arr exchangeObjectAtIndex:index withObjectAtIndex:to];
    completionBlock([NSArray arrayWithArray:arr]);
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
