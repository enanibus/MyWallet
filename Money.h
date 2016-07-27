//
//  Money.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 27/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

-(instancetype) initWithAmount:(NSInteger) amount;

-(Money *) times: (NSInteger) multiplier;

@end
