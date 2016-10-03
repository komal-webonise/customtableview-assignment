//
//  AddProductViewController.m
//  NavigationBarAssignment
//
//  Created by komal lunkad on 19/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "AddProductViewController.h"
#import "ListProductsViewController.h"
#import "Products.h"
#import "AppDelegate.h"
#import "Constants.h"

@interface  AddProductViewController (){
    IBOutlet UITextField *textFieldProductName;
    IBOutlet UITextField *textFieldProductPrice;
    IBOutlet UITextField *textFieldProductCategory;
}
@end

@implementation AddProductViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** Checks for extreme whitespaces and trims it
 * \param name The input whose extreme whitespaces are to be checked
 * \returns Returns yes if whitespaces are  present else it returns no
 */
-(BOOL)isWhitespace:(NSString*)name{
    NSString *trimmedName = [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if(trimmedName.length == 0){
        return NO;
    }
    return YES;
}

/** Checks for alphabets and other characters in the string
 * \param input The input whose content character set is to be checked
 * \returns Returns yes if alphabets are only present else it returns no
 */
-(BOOL)isAlphaOnly:(NSString *)input
{
    NSString *regExp = ALPHABETIC_REGULAR_EXPRESSION;
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExp];
    return [regexTest evaluateWithObject:input];
}

/** Checks for numbers, decimal point and number of digits
 * \param input The input whose content number set is to be checked
 * \returns Returns yes if numbers, decimal point and number of digits within limit are only present else it returns no
 */
-(BOOL)isNumericOnly:(NSString *)input
{
    NSString *regExp = ALPHANUMERIC_REGULAR_EXPRESSION;
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExp];
    return [regexTest evaluateWithObject:input];
}
/** Clears all text fields
 */
-(void)clearTextField{
    textFieldProductName.text = CLEAR_STRING;
    textFieldProductPrice.text = CLEAR_STRING;
    textFieldProductCategory.text = CLEAR_STRING;
}

/** Saves product to the array
 */
-(void)saveProduct{
    Products *product = [[Products alloc]init];
    product.productName = textFieldProductName.text;
    product.productPrice = [textFieldProductPrice.text floatValue];
    product.productCategory = textFieldProductCategory.text;
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate.arrayProducts addObject:product];
}

/** Pops previous view controller
 */
-(void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

/** Validates textfields and saves that to array on click of button save
 * \param sender The id of save button
 * \returns Returns action on click of button
 */
- (IBAction)saveButtonTapped:(id)sender {
    NSString *productName = textFieldProductName.text;
    NSString *productCategory = textFieldProductCategory.text;
    if(![self isWhitespace:productName]){
        [textFieldProductName becomeFirstResponder];
    }
    else if(![self isWhitespace:textFieldProductPrice.text]){
        [textFieldProductPrice becomeFirstResponder];
    }
    else if(![self isNumericOnly:textFieldProductPrice.text]){
        NSLog(@"Number ranging from 10 to 99999 and after decimal point only two numbers.");
    }
    else if(![self isWhitespace:productCategory]){
        [textFieldProductCategory becomeFirstResponder];
    }
    else if(![self isAlphaOnly:productName] || ![self isAlphaOnly:productCategory]){
        NSLog(@"Only character set allowed.");
    }
    else{
        [self saveProduct];
        [self popViewController];
    }
}

@end



