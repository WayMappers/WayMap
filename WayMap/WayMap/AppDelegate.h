//
//  AppDelegate.h
//  WayMap
//
//  Created by carlos arellano and jean jeon on 4/5/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) NSMutableArray* CheckInLocations;
@property (strong,nonatomic) NSMutableArray* LocationsNearby;
@property (strong) NSMutableArray*UserAddedLocations;

@end

