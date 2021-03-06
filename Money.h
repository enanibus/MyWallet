//
//  Money.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 27/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;
@class Broker;

@protocol Money <NSObject>

-(id) initWithAmount:(NSInteger) amount
            currency: (NSString *) currency;

-(id<Money>) times: (NSInteger) multiplier;

-(id<Money>) plus:(Money *) other;

-(id<Money>) reduceToCurrency:(NSString*) currency withBroker:(Broker*) broker;


@end

@interface Money : NSObject<Money>

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;



@end
