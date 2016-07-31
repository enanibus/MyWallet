//
//  WalletTableViewControllerTests.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 30/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Money.h"
#import "Broker.h"

@interface WalletTableViewControllerTests : XCTestCase
@property (nonatomic,strong) WalletTableViewController *walletVC;
@property (nonatomic,strong) Wallet *wallet;
@property (nonatomic,strong) Broker *broker;
@end

@implementation WalletTableViewControllerTests

- (void)setUp {
    [super setUp];
    // Creamos el entorno del laboratorio
    self.wallet = [[Wallet alloc]initWithAmount:10 currency:@"EUR"];
    [self.wallet plus:[Money dollarWithAmount:10]];
    
//    self.wallet = [[Wallet alloc] initWithAmount:1 currency:@"USD"];
//    [self.wallet plus: [Money euroWithAmount:1]];
    
    self.broker = [Broker new];
    [self.broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    self.walletVC = [[WalletTableViewController alloc]
                    initWithModel:self.wallet
                    broker:self.broker];
}

- (void)tearDown {
    [super tearDown];
}

-(void) testThatCurrenciesIsEqualToNumberOfSectionsPlusOne{
    NSInteger numberOfSection = [self.walletVC numberOfSectionsInTableView:self.walletVC.tableView];
    XCTAssertEqual(numberOfSection, 3, @"Number of currencies should be equal to number of sections + 1");
    
}

-(void) testThatMoneysForCurrencyIsEqualToNumberOfCellsPlusOne{
    NSInteger numberOfMoneys = [self.walletVC tableView:self.walletVC.tableView numberOfRowsInSection:0];
    XCTAssertEqual(numberOfMoneys, 2, @"Number of moneys for current currency should be equal to number of cells for that currency + 1");
    
}

-(void) testCurrencyAtIndex{
    NSString *currencyAtIndex0 = [self.walletVC currencyAtIndex:0];
    NSString *currencyAtIndex1 = [self.walletVC currencyAtIndex:1];
    NSString *currencyAtIndex2 = [self.walletVC currencyAtIndex:2];
    
    XCTAssertEqualObjects(currencyAtIndex0, @"EUR", @"Index 0 should be -> EUR");
    XCTAssertEqualObjects(currencyAtIndex1, @"USD", @"Index 1 should be -> USD");
    XCTAssertEqualObjects(currencyAtIndex2, nil,    @"Index 2 should be -> nil");
}

-(void) testTotalForCurrencyEuro{
    Money *total = [self.wallet totalForCurrencyEuro:self.broker];
    
    XCTAssertEqual([[total amount]doubleValue],15, @"10€ + 10$ = 15€");
    
}

@end
