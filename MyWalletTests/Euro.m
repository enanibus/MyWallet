//
//  Euro.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 18/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Euro.h"

@implementation Euro

-(instancetype) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        _amount = amount;
    }
    return self;
}

-(void)times: (NSInteger) multiplier{
    
    _amount = _amount * multiplier;
}

@end
