//
//  TableViewCell.m
//  NavigationBarAssignment
//
//  Created by komal lunkad on 20/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize labelProductName,labelProductPrice;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
