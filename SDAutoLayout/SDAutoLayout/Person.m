//
//  Person.m
//  SDAutoLayout
//
//  Created by etmedia on 2017/6/20.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ([super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [[aDecoder decodeObjectForKey:@"age"] integerValue];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:[NSNumber numberWithInteger:self.age] forKey:@"age"];
}

@end
