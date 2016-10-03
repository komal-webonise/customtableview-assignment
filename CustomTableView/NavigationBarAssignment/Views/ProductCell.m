//
//  TableViewCell.m
//  NavigationBarAssignment
//
//  Created by komal lunkad on 20/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell
@synthesize labelProductName,labelProductPrice;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
