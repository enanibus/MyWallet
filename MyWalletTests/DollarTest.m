//
//  DollarTest.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 23/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dollar.h"  

@interface DollarTest : XCTestCase

@end

@implementation DollarTest

-(void) testMultiplication{
    
    Dollar *five = [[Dollar alloc] initWithAmount: 5];
    Dollar *total = [five times:2];
    Dollar *ten = [[Dollar alloc] initWithAmount: 10];

    XCTAssertEqualObjects(ten, total, @"$5 *2 = $10");
}

-(void) testEquality{
    
    Dollar *five = [[Dollar alloc] initWithAmount: 5];
    Dollar *total = [five times:2];
    Dollar *ten = [[Dollar alloc] initWithAmount: 10];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal!");
}

-(void) testHash{
    
    Dollar *a = [[Dollar alloc] initWithAmount:2];
    Dollar *b = [[Dollar alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    
}

-(void) testAmountStorage{
    
    Dollar *dolar = [[Dollar alloc] initWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dolar performSelector:@selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
    
}

@end
