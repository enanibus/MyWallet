//
//  Dollar.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 25/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dollar : NSObject

-(instancetype) initWithAmount:(NSInteger) amount;

-(Dollar*)times: (NSInteger) multiplier;

@end
