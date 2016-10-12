//
//  NSArray+BlockNSArray.h
//  MemoryManagingProj
//
//  Created by Ленар on 11.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BlockNSArray)

-(void)getUniqueArray:(void(^)(NSArray*))completionBlock;
-(void)replaceObjectAtIndex:(int)index andB:(int)to withCompletionBlock:(void(^)(NSArray*))completionBlock;
-(void)cheakArray:(void(^)(int count, NSString *arrayData))success failureBlock:(void(^)(NSString *error))failure;

@end
