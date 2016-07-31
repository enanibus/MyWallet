//
//  Wallet.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 29/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "Wallet.h"
#import <UIKit/UIKit.h>

@interface Wallet()

@end


@implementation Wallet

-(NSUInteger) count{
    return [self.moneys count];
}

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    
    if (self = [super init]) {
        Money *money = [[Money alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    
    return self;
}

-(id<Money>)plus:(Money *)money{
    
    [self.moneys addObject: money];
    return self;
}


-(id<Money>) times:(NSInteger)multiplier{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (Money *each in self.moneys){
        
        Money *newMoney = [each times:multiplier];
        [newMoneys addObject: newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

-(id<Money>) reduceToCurrency:(NSString*)currency
                   withBroker:(Broker*) broker{
    
    Money *result = [[Money alloc] initWithAmount:0 currency:currency];
    
    for (Money *each in self.moneys){
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
        
    }
    return result;
    
}

-(void) subscribeToMemoryWarning:(NSNotificationCenter * ) nc{
    
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}

-(void) dumpToDisk:(NSNotification * )notification{
    
}

#pragma mark - Table methods

-(NSUInteger) moneyCountForCurrency:(NSString *) currency{
    
    if (currency == nil){
        return 0;
    }
    
    NSMutableArray *moneysForCurrency = [NSMutableArray array];
    for (Money *eachMoney in self.moneys){
        if ([eachMoney.currency isEqualToString:currency]){
            [moneysForCurrency addObject:eachMoney];;
        }
    }
        
    if (moneysForCurrency.count <= 0){
            return 0;
    }
    
    return [moneysForCurrency count];
}

-(Money *) moneyAtIndex:(NSInteger)index forCurrency:(NSString *)currency {
    
    if (index < 0) {
        return nil;
    }
    
    if (index > [self moneyCountForCurrency:currency]-1){
        return nil;
    }
    
    if ([self moneyCountForCurrency:currency] <= 0){
        return nil;
    }
    else{
        NSMutableArray *moneysForCurrency = [NSMutableArray array];
        for (Money *eachMoney in self.moneys){
            if ([eachMoney.currency isEqualToString:currency]){
                [moneysForCurrency addObject:eachMoney];
            }
        }
    
        return moneysForCurrency[index];
    }
}


-(Money *)subTotalForCurrency:(NSString *)currency {
    
    Money *subTotal = [Money new];
    
    NSMutableArray *moneysForCurrency = [NSMutableArray array];
    for (Money *eachMoney in self.moneys){
        if ([eachMoney.currency isEqualToString:currency]){
            [moneysForCurrency addObject:eachMoney];;
        }
    }
    
    for (Money *eachMoney in moneysForCurrency) {
        subTotal = [subTotal plus:eachMoney];
    }
    
    return subTotal;
}


-(Money *)totalForCurrencyEuro:(Broker*)broker{
    
    Money *total = [Money euroWithAmount:0];
    
    for (Money *money in self.moneys) {
        total = [total plus:[money reduceToCurrency:@"EUR"
                                         withBroker:broker]];
    }
    return total;
}

@end
