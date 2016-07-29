//
//  Broker.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 28/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Broker.h"
#import "Money.h"

@interface Broker()
@property (nonatomic, strong) NSMutableDictionary *rates;
@end

@implementation Broker

-(id) init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(id<Money>)reduce:(Money *) money
      toCurrency:(NSString *) currency{
    
    Money *result;
    double rate = [[self.rates objectForKey:[self
                                                keyFromCurrency:money.currency
                                                toCurrency:currency]] doubleValue];
    
    // Comprobamos que divisa de origen y de destino son las mismas
    if ([money.currency isEqual:currency]) {
        result = money;
    }else if (rate == 0){
        // No hay tasa de conversión, excepción que te crió
        [NSException raise:@"NoConversionException"
                    format:@"Must have a conversion from %@ to %@", money.currency, currency];
    }else{
        // Tenemos conversión
    
        double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
                                                          toCurrency:currency]] doubleValue];
    
        NSInteger newAmount = [money.amount integerValue] * rate;
    
        result = [[Money alloc]
                                initWithAmount:newAmount
                                currency:currency];
    }
    
    return result;
}


-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString *) toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self
                           keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
    
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject:invRate
                   forKey:[self
                           keyFromCurrency:toCurrency
                           toCurrency:fromCurrency]];
    
}


#pragma mark - utils

-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
    
}


@end
