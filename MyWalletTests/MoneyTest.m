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

-(void) testMultiplication{
    
    Money *euro = [Money euroWithAmount:5];
    Money *ten = [Money euroWithAmount:10];
    Money *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}

-(void) testEquality{
    
    Money *five = [Money euroWithAmount:5];
    Money *ten = [Money euroWithAmount:10];
    Money *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    XCTAssertEqualObjects([Money dollarWithAmount:4],
                          [[Money dollarWithAmount:2] times:2], @"Equivalent objects should be equal!");
}


-(void) testDifferentCurrencies{
    
    Money *euro = [Money euroWithAmount:1];
    Money *dollar = [Money dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies should not be equal!");
}

-(void) testHash{
    
    Money *a = [Money euroWithAmount:2];
    Money *b = [Money euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    XCTAssertEqual([[Money dollarWithAmount:1] hash],
                   [[Money dollarWithAmount:1] hash], @"Equal objects must have same hash");
    
}

-(void) testAmountStorage{
    
    Money *euro = [Money euroWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
    
    XCTAssertEqual(2, [[[Money dollarWithAmount:2] performSelector:@selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
    
}


@end
