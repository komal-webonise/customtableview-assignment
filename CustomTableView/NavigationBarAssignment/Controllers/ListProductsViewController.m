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
#include "ProductCell.h"
#import "Constants.h"

@interface ListProductsViewController (){
    IBOutlet UITableView *tableViewListProducts;
    UIView *viewNoItem;
    UIButton *buttonListProduct;
}
@end

@implementation ListProductsViewController
AppDelegate *appDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    UIBarButtonItem *barButtonItemAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navigateToAddProductsScreen)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = barButtonItemAdd;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    [self->tableViewListProducts reloadData];
}

/** Navigates to screen add product details
 */
-(void)navigateToAddProductsScreen {
    AddProductViewController *addProductViewController = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ADDPRODUCTS_VIEWCONTROLLER];
    [self.navigationController pushViewController:addProductViewController animated:YES];}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [appDelegate.arrayProducts count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *customCellIdentifier = CUSTOM_TABLE_VIEW_CELL ;
    ProductCell *productCell = [tableView dequeueReusableCellWithIdentifier:customCellIdentifier];
    
    if (productCell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:customCellIdentifier owner:self options:nil];
        productCell = [nib objectAtIndex:0] ;
    }
    productCell.labelProductName.text = [appDelegate.arrayProducts[indexPath.row] productName];
    productCell.labelProductPrice.text = [NSString stringWithFormat:@"%0.2f", [appDelegate.arrayProducts[indexPath.row] productPrice]];
    productCell.imageViewPhoto.image = [UIImage imageNamed:IMAGE_SAMPLE];
    return productCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Products *product = [appDelegate.arrayProducts objectAtIndex:indexPath.row];
    ShowDetailsViewController *showDetailsViewController = [self.storyboard instantiateViewControllerWithIdentifier:STORYBOARD_SHOWDETAILS_VIEWCONTROLLER];
    showDetailsViewController.product = product;
    [self.navigationController pushViewController:showDetailsViewController animated:YES];

   }
@end
