//
//  UserProfileViewController.h
//  WayMap
//
//  Created by Jean Jeon on 4/22/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GooglePlace.h"
@interface UserProfileViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) NSMutableArray *userAddedPlaces;
@property (strong, nonatomic) NSMutableArray *favoritePlaces;

- (IBAction)ProfilePictureUpload:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end
