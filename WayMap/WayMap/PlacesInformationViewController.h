//
//  PlacesInformationViewController.h
//  WayMap
//
//  Created by carlos arellano on 4/18/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GooglePlace.h"
@import Mapbox;
@import MapKit;
@import GooglePlaces;
@import GooglePlacePicker;

@interface PlacesInformationViewController : UIViewController
@property (strong)  GooglePlace*SelectedPlace;
@end
