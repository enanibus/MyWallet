//
//  Wallet.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 29/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Wallet : NSObject<Money>
@property (nonatomic, readonly) NSUInteger count;

-(void) subscribeToMemoryWarning:(NSNotificationCenter * ) nc;
@end
