//
//  LogInViewController.h
//  WayMap
//
//  Created by Jean Jeon on 4/22/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController

@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet UILabel *ErrorLabel;
@property (nonatomic) Boolean isSignIn;
@end
