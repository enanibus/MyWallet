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

-(Money *) plus:(Money *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    Money *total = [[Money alloc] initWithAmount:totalAmount
                                        currency:self.currency];
    
    return total;
}

#pragma mark - Overwritten

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class], self.currency, self.amount];
    
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
    
    return [self.amount integerValue];
}


@end
