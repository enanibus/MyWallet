//
//  Broker.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 28/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;

@interface Broker : NSObject

-(Money *)reduce:(Money *) money toCurrency:(NSString *) currency;

@end
