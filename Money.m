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


@implementation Money

-(id) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        _amount = @(amount);
    }
    return self;
}

-(Money*)times: (NSInteger) multiplier{

    // no se debería llamar, si no que debería
    // de usar el de la subclase
    return [self subclassResponsibility:_cmd];
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
