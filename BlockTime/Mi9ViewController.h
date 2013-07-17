//
//  Mi9ViewController.h
//  BlockTime
//
//  Created by Daphne Chong on 17/07/13.
//  Copyright (c) 2013 Daphne Chong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mi9ViewController : UIViewController

@property (nonatomic) IBOutlet UITextField *textField;
@property (nonatomic) IBOutlet UILabel *label;
@property (nonatomic) UIButton *encryptButton;

- (IBAction)encryptText:(id)sender;
@end
