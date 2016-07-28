//
//  Money.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 27/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;


-(id) initWithAmount:(NSInteger) amount;

-(id) times: (NSInteger) multiplier;

@end
