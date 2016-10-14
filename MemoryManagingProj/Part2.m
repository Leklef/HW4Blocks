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
    @synchronized (self){
        if(!_arr){
            _arr = [[NSMutableArray alloc]init];
        }
    }
    return _arr;
}

-(void)setArr:(NSMutableArray*)arr{
    @synchronized (self) {
        _arr = arr;
    }
}

-(NSString*)str{
    @synchronized (self) {
        if(!_str){
            _str = [[NSString alloc]init];
        }
    }
    return _str;
}

-(void)setStr:(NSString *)str{
    @synchronized (self) {
        _str = str;
    }
}

-(void)hello{
    _string = @"hello";
}


@end
