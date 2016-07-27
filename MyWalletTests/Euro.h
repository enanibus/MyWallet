//
//  Euro.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 18/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Euro : Money

-(Euro*)times: (NSInteger) multiplier;

@end
