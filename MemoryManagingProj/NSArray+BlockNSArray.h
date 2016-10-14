//
//  NSArray+BlockNSArray.h
//  MemoryManagingProj
//
//  Created by Ленар on 11.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BlockNSArray)

-(void)getUniqueArray:(NSArray *)arr withBlock:(void(^)(NSArray* secondArr))completionBlock;
-(void)replaceObjectAtIndex:(int)index withObjectAtIndex:(int)to withCompletionBlock:(void(^)(NSArray*))completionBlock failureBlock:(void(^)(NSString *error))failure;
-(void)cheakArray:(void(^)(int count, NSString *arrayData))success failureBlock:(void(^)(NSString *error))failure;

@end
