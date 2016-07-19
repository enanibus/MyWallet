//
//  EuroTests.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 18/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

@import XCTest;
#import "Euro.h"

@interface EuroTests : XCTestCase

@end

@implementation EuroTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testSimplelMultiplication{
   
    Euro *total = [[Euro alloc] initWithAmount:5];
    [total times: 2];
    XCTAssertEqual(total.amount, 10);
}

@end
