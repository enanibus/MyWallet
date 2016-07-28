//
//  Money.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 27/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"
#import "Money-Private.h"
#import "Euro.h"
#import "Dollar.h"

@implementation Money

+(id) euroWithAmount:(NSInteger) amount{
    
    return [[Money alloc] initWithAmount:amount];
    
}


+(id) dollarWithAmount:(NSInteger) amount{
    
    return [[Money alloc] initWithAmount:amount];
}


-(id) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        _amount = @(amount);
    }
    return self;
}

-(id)times: (NSInteger) multiplier{
        
    Money *newMoney = [[Money alloc]
                         initWithAmount:[self.amount integerValue] * multiplier];
    return newMoney;
    
}


#pragma mark - Overwritten

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@ %ld>",
            [self class], (long)[self amount]];
    
}
 
-(BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}

-(NSUInteger) hash{
    
    return (NSUInteger) self.amount;
}


@end
