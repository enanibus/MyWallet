//
//  Dollar.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 25/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Dollar : Money

-(instancetype) initWithAmount:(NSInteger) amount;

-(Dollar*)times: (NSInteger) multiplier;

@end
