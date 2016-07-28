//
//  MoneyTest.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 27/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"

@interface MoneyTest : XCTestCase

@end

@implementation MoneyTest

-(void) testMoneyCurrency{

    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:1] currency],
                          @"The currency of euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:1] currency],
                          @"The currency of dollars should be USD");
    
}

@end
