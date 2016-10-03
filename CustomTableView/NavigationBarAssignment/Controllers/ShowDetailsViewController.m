//
//  ShowDetailsViewController.m
//  NavigationBarAssignment
//
//  Created by komal lunkad on 20/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//


#import "ShowDetailsViewController.h"

@interface  ShowDetailsViewController(){
    IBOutlet UILabel *labelProductName;
    IBOutlet UILabel *labelProductprice;
    IBOutlet UILabel *labelProductCategory;
}
@end

@implementation ShowDetailsViewController
@synthesize product;
/** Assigns labels with product values
 * \param animated Sends animated value
 */
-(void) viewWillAppear:(BOOL)animated{
    labelProductName.text = [NSString stringWithFormat:@"Product Name : %@", product.productName];
    labelProductprice.text=[NSString stringWithFormat:@"Product Price : %@", [[NSNumber numberWithFloat:product.productPrice] stringValue]];
    labelProductCategory.text = [NSString stringWithFormat:@"Product Category : %@", product.productCategory];
}
@end