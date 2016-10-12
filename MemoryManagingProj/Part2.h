//
//  Part2.h
//  MemoryManagingProj
//
//  Created by Ленар on 10.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Part2 : UIView

@property (strong, atomic) NSString *str;
@property (strong, atomic) NSMutableArray *arr;
@property (strong, readonly) NSString *string;
@property (nonatomic)int notNullInt;

-(void)hello;

@end
