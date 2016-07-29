//
//  Money.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 27/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;


-(id) initWithAmount:(NSInteger) amount
            currency: (NSString *) currency;

-(id) times: (NSInteger) multiplier;

-(Money *) plus:(Money *) other;

@end
