//
//  WalletTableViewController.h
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 30/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;
@class Broker;

@interface WalletTableViewController : UITableViewController

-(id) initWithModel:(Wallet *) model broker:(Broker *)broker;

-(NSString *) currencyAtIndex:(NSInteger)index;

@end
