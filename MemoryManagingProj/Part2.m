//
//  Part2.m
//  MemoryManagingProj
//
//  Created by Ленар on 10.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "Part2.h"

@interface Part2 ()

@end

@implementation Part2

@synthesize arr=_arr;
@synthesize str=_str;
@synthesize string=_string;
@synthesize notNullInt=_notNullInt;

-(int)notNullInt{
    return _notNullInt;
}
-(void)setNotNullInt:(int)notNullInt{
    if(notNullInt<0){
        _notNullInt=0;
    }else{
        _notNullInt=notNullInt;
    }
}

-(NSMutableArray*)arr{
    return _arr;
}

-(void)setArr:(NSMutableArray*)array{
    _arr = array;
}

-(NSString*)str{
    return _str;
}

-(void)setStr:(NSString *)str{
    _str = str;
}

-(void)hello{
    _string = @"hello";
}


@end
