//
//  Money.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 27/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Money.h"


@interface Money()

@property(readonly) NSInteger amount;

@end

@implementation Money

-(instancetype) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        _amount = amount;
    }
    return self;
}

-(Money*)times: (NSInteger) multiplier{

    // no se debería llamar, si no que debería
    // de usar el de la subclase
    return self;
}


@end
