//
//  Mi9ViewController.m
//  BlockTime
//
//  Created by Daphne Chong on 17/07/13.
//  Copyright (c) 2013 Daphne Chong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mi9ViewController.h"
typedef NSString * (^RotXBlock) (NSString*);

@interface Mi9ViewController ()

@end

@implementation Mi9ViewController {

    RotXBlock _encryptionBlock;
}

- (RotXBlock) getEncryptionBlock{
    if (!_encryptionBlock) {
        __block NSUInteger rotValue = 0;
        
        
        RotXBlock rotX = ^(NSString *theText) {
            NSMutableString *holder = [theText mutableCopy];
            unichar theChar;
            int i;
            
            for(i = 0; i < [theText length]; i++) {
                theChar = [theText characterAtIndex:i];
                if(theChar <= 122 && theChar >= 97) {
                    if(theChar + rotValue > 122)
                        theChar -= rotValue;
                    else
                        theChar += rotValue;
                    [holder replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%C", theChar]];
                    
                    
                } else if(theChar <= 90 && theChar >= 65) {
                    if((int)theChar + rotValue > 90)
                        theChar -= rotValue;
                    else
                        theChar += rotValue;
                    
                    [holder replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%C", theChar]];
                    
                } else {
                    [holder replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%C", theChar]];
                }
            }
            
            rotValue += 1;
            NSString* output = [NSString stringWithString:holder];
            return output;
        };
        _encryptionBlock = rotX;
    }
    
    return _encryptionBlock;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)encryptText:(id)sender {
    NSString *textToEncrypt = self.textField.text;    
    
    RotXBlock block = [self getEncryptionBlock];
    
    self.label.text = block(textToEncrypt);
}

@end
