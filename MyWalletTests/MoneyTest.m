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

-(void) testThatTimesRaisesException{
    
    Money *money = [[Money alloc] initWithAmount:1];
    XCTAssertThrows([money times:2], @"Should raise an exception");
}

@end
