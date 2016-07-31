//
//  WalletTableViewController.m
//  MyWallet
//
//  Created by Jacobo Enriquez Gabeiras on 30/7/16.
//  Copyright © 2016 enanibus. All rights reserved.
//

#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Broker.h"


@interface WalletTableViewController ()
@property (nonatomic,strong) Wallet *model;
@property (nonatomic,strong) Broker *broker;
@end

@implementation WalletTableViewController

-(id) initWithModel:(Wallet *)model broker:(Broker *)broker{
    if (self = [super initWithStyle:UITableViewStylePlain]){
        _model = model;
        _broker = broker;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MyWallet";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.broker.currencies count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == [self.broker.currencies count]){
        return 1;
    }else{
        return [self moneyCountForCurrency:section] + 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }

    // Configure the cell...
    
    Money *money = [self moneyForIndexPath:indexPath];

    cell.textLabel.text = money.currency;
    cell.detailTextLabel.text = money.amount.description;

    if (indexPath.section == [self.tableView numberOfSections]-1) {
        
        cell.textLabel.text = @"Total EUR";
        cell.detailTextLabel.text = [self.model totalForCurrencyEuro:self.broker].amount.description;
    }
    
    if (indexPath.row == [self.tableView numberOfRowsInSection:indexPath.section]-1){
        
        if (![cell.textLabel.text  isEqual: @"Total EUR"]) {
            cell.textLabel.text = @"SubTotal";
            cell.detailTextLabel.text = [self.model subTotalForCurrency:[self currencyAtIndex:indexPath.section]].amount.description;
        }
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section < [self.broker.currencies count]) {
        NSArray *array = [self.broker.currencies allObjects];
        return array[section];
    }
    
    return @"€";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Utils
-(NSInteger) moneyCountForCurrency: (NSInteger)section{
    NSInteger count=0;
    NSArray *currencies = [self.broker.currencies allObjects];
    for (Money *eachMoney in self.model.moneys){
        if ([eachMoney.currency isEqualToString: currencies[section] ]){
            count = count + 1;
        }
    }
    return count;
}

-(NSString *) currencyAtIndex:(NSInteger)index{
    NSArray * currencies =[self.broker.currencies allObjects];
    if (currencies.count != 0 && index<currencies.count){
        return [currencies[index] description];
    }
    else{
        return nil;
    }
}

-(Money *) moneyForIndexPath:(NSIndexPath*) indexPath {
    
    NSString *currencyAtIndex = [self currencyAtIndex:indexPath.section];
    return [self.model moneyAtIndex:indexPath.row forCurrency:currencyAtIndex];
}


@end

