//
//  ViewController.h
//  NavigationBarAssignment
//
//  Created by komal lunkad on 19/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListProductsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableViewListProducts;


@end

