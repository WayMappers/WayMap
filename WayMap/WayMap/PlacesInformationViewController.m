//
//  PlacesInformationViewController.m
//  WayMap
//
//  Created by Carlos Arellano and Jean Jeon on 4/18/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "PlacesInformationViewController.h"
#import "AppDelegate.h"
@import FirebaseAuth;
@import FirebaseDatabase;

@interface PlacesInformationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *temp;
@property (weak, nonatomic) IBOutlet UIButton *ReturnMaps;
@property (weak, nonatomic) IBOutlet UILabel *BasedOn;

@property (weak, nonatomic) IBOutlet UILabel *PlaceAddress;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation PlacesInformationViewController
@synthesize SelectedPlace,segueUsed,sourceArrayName,UserAddedTitle,CheckedInLocations, favoriteBtn, favoritedLabel, placeNameLabel;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"pushing back to da maps");
}
- (IBAction)CheckIntoPlace:(id)sender {
    //check in
    AppDelegate *myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    SelectedPlace.CheckedIn=true;
    [CheckedInLocations addObject:SelectedPlace];
    myDelegate.CheckInLocations=CheckedInLocations;
    _CheckInButton.hidden=true;
    _IsCheckedIn.hidden=false;
    
    FIRUser *user = [FIRAuth auth].currentUser;
    [[[[[_ref child:@"users"] child:user.uid] child:@"Places Visited"] child:@"Name"] setValue:placeNameLabel.text];
    
    [[[[[_ref child:@"users"] child:user.uid] child:@"Places Visited"] child:@"Address"] setValue:_PlaceAddress.text];
}
-(void)viewDidLoad{
    self.ref = [[FIRDatabase database] reference];
}

- (IBAction)favoriteBtnTapped:(UIButton *)sender {
    FIRUser *user = [FIRAuth auth].currentUser;
    [[[[[_ref child:@"users"] child:user.uid] child:@"Favorite Places"] child:@"Name"] setValue:placeNameLabel.text];
    
    [[[[[_ref child:@"users"] child:user.uid] child:@"Places Visited"] child:@"Address"] setValue:_PlaceAddress.text];
    
    [favoriteBtn setHidden:YES];
    [favoritedLabel setHidden:NO];

}

- (void)viewWillAppear:(BOOL)animated{
    [favoriteBtn setHidden:NO];
    [favoritedLabel setHidden:YES];
    
    if (SelectedPlace.CheckedIn){
        _CheckInButton.hidden=true;
        _IsCheckedIn.hidden=false;
    }
    else{
        _IsCheckedIn.hidden=true;
        _CheckInButton.hidden=false;
    }
    _BasedOn.text=[NSString stringWithFormat:@"Based on %@ Category:",sourceArrayName];
    self.ReturnMaps.userInteractionEnabled=true;
    self.title=SelectedPlace.name;
    self.placeNameLabel.adjustsFontSizeToFitWidth=YES;
    self.PlaceAddress.adjustsFontSizeToFitWidth=YES;
    self.placeNameLabel.text=SelectedPlace.name;
    self.PlaceAddress.text=SelectedPlace.formattedAddress;
    NSLog(@"Current view controller");
    if (![segueUsed isEqualToString:@"tapToLocation"]){
        self.ReturnMaps.hidden=true;
    }
    if (![segueUsed isEqualToString:@"SurpriseMe2"]){
        self.BasedOn.hidden=true;
    }
    if (!SelectedPlace.UserAdded){
        self.UserAddedTitle.hidden=true;
    }

    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
