//
//  ViewController.m
//  NavigationBarAssignment
//
//  Created by komal lunkad on 19/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "ListProductsViewController.h"
#import "AddProductViewController.h"
#import "AppDelegate.h"
#import "Products.h"
#import "ShowDetailsViewController.h"
#include "TableViewCell.h"
@interface ListProductsViewController (){
    UIView *viewNoItem;
    UIButton *buttonListProduct;
}
@end
@implementation ListProductsViewController
@synthesize tableViewListProducts;
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButtonItemAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProducts)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = barButtonItemAdd;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
   // [self displayViewsList];
}
-(void) viewWillAppear:(BOOL)animated{
    [self.tableViewListProducts reloadData];
    //[viewNoItem removeFromSuperview];
}
/** Navigates to screen add product details
 */
-(void)addProducts {
    AddProductViewController *addProductViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"AddProductViewController"];
    [self.navigationController pushViewController:addProductViewController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return [appDelegate.arrayProducts count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *customCellIdentifier = @"TableViewCell" ;
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:customCellIdentifier];
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:customCellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0] ;
    }
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    cell.labelProductName.text = [appDelegate.arrayProducts[indexPath.row] productName];
    cell.labelProductPrice.text = [NSString stringWithFormat:@"%0.2f", [appDelegate.arrayProducts[indexPath.row] productPrice]];
    cell.imageViewPhoto.image=[UIImage imageNamed:@"imageSample"];
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    Products *product=[appDelegate.arrayProducts objectAtIndex:indexPath.row];
    ShowDetailsViewController *showDetailsViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ShowDetailsViewController"];
    showDetailsViewController.product=product;
    [self.navigationController pushViewController:showDetailsViewController animated:YES];
}
@end
