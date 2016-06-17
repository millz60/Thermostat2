//
//  ViewController.h
//  Thermostat
//
//  Created by Matt Milner on 6/16/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
}

@property (nonatomic,weak) IBOutlet UISlider *tempControl;
@property (nonatomic,weak) IBOutlet UISegmentedControl *unitSelector;
@property (nonatomic,weak) IBOutlet UILabel *tempDisplay;
@property (nonatomic,weak) IBOutlet UILabel *currentTemp;

@end

