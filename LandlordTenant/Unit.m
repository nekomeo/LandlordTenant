//
//  Unit.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "Unit.h"

@implementation Unit

- (instancetype)initWithUnitNumber:(int)unitNumber withTenant:(NSString *)tenant isVacant:(BOOL)isVacant andColor:(int)color;
{
    if (self = [super init])
    {
        _unitNumber = unitNumber;
        _tenant = tenant;
        _isVacant = isVacant;
        _color = color;
    }
    return self;
}

@end
