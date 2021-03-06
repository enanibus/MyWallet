//
//  Broker.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 28/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Broker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;
@property (nonatomic,readonly) NSMutableSet *currencies;

-(Money *)reduce:(id<Money>) money toCurrency:(NSString *) currency;
-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString *) toCurrency;

-(NSString *) keyForCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency;

-(void) parseJSONRates:(NSData *) json;

@end
