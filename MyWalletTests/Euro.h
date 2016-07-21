//
//  Euro.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 18/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Euro : NSObject

@property(readonly) NSInteger amount;

-(instancetype) initWithAmount:(NSInteger) amount;

-(Euro*)times: (NSInteger) multiplier;

@end
