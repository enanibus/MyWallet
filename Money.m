//
//  Money.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 27/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"

@interface Money()

@property (nonatomic) NSNumber *amount;

@end

@implementation Money

+(id) euroWithAmount:(NSInteger) amount{
    
    return [[Money alloc] initWithAmount:amount currency: @"EUR"];
    
}


+(id) dollarWithAmount:(NSInteger) amount{
    
    return [[Money alloc] initWithAmount:amount currency: @"USD"];
}


-(id) initWithAmount:(NSInteger) amount currency:(NSString *) currency{
    
    if (self = [super init]){
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

-(id)times: (NSInteger) multiplier{
        
    Money *newMoney = [[Money alloc]
                         initWithAmount:[self.amount integerValue] * multiplier
                       currency: self.currency];
    return newMoney;
    
}


#pragma mark - Overwritten

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@ %ld>",
            [self class], (long)[self amount]];
    
}
 
-(BOOL)isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }
    else{
        return NO;
    }
}

-(NSUInteger) hash{
    
    return (NSUInteger) self.amount;
}


@end
