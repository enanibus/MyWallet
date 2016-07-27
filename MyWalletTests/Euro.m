//
//  Euro.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 18/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Euro.h"

@interface Euro()

@property(readonly) NSInteger amount;

@end

@implementation Euro

-(instancetype) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        _amount = amount;
    }
    return self;
}

-(Euro*)times: (NSInteger) multiplier{
    
    Euro *newEuro = [[Euro alloc]
                     initWithAmount:self.amount *multiplier];
    return newEuro;
}


#pragma mark - Overwritten
-(BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}


-(NSUInteger) hash{
    
    return (NSUInteger) self.amount;
}


@end
