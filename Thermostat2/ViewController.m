//
//  ViewController.m
//  Thermostat
//
//  Created by Matt Milner on 6/16/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSString *url = @"http://api.openweathermap.org/data/2.5/weather?q=Houston,us&appid=79ed1ec9b150db0cac2f9ade769ef67c";
//    NSURL *urlRequest = [NSURL URLWithString:url];
//    NSError *err = nil;
//    NSString *html = [NSString stringWithContentsOfURL:urlRequest encoding:NSUTF8StringEncoding error:&err];
//
//    
//    NSString *temp = [html substringFromIndex:[html rangeOfString:@"temp"].location + 6];
//    NSString *revisedTemp = [temp substringToIndex:6];
//    
//    int fahrenheitFromKelvin = (((revisedTemp.integerValue)*9)/5) - 459.67;
//    int celsiusFromKelvin = revisedTemp.integerValue - 273.15;
//    NSLog(@"%d",fahrenheitFromKelvin);
//    NSLog(@"%d",celsiusFromKelvin);
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) sliderMoved: (UISlider *) slider{
    
    int sliderValue = (int) self.tempControl.value;
    
    NSString *labelText = self.tempDisplay.text;
    
    if (self.unitSelector.selectedSegmentIndex == 0) {
    self.tempDisplay.text = [NSString stringWithFormat:@"%i°", sliderValue];
    }
    else{
        self.tempDisplay.text = [NSString stringWithFormat:@"%i°", sliderValue];
    }
    
    if ((labelText.integerValue > 90 && self.unitSelector.selectedSegmentIndex == 0) || (labelText.integerValue > 32 && self.unitSelector.selectedSegmentIndex == 1) ){
        self.view.backgroundColor = [UIColor redColor];
        
    } else if ((labelText.integerValue < 20 && self.unitSelector.selectedSegmentIndex == 0) || (labelText.integerValue < -6 && self.unitSelector.selectedSegmentIndex == 1)){
        self.view.backgroundColor = [UIColor blueColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
}


- (IBAction)segmentedControlPressed:(UISegmentedControl *) control{
    
    NSString *url = @"http://api.openweathermap.org/data/2.5/weather?q=Houston,us&appid=79ed1ec9b150db0cac2f9ade769ef67c";
    NSURL *urlRequest = [NSURL URLWithString:url];
    NSError *err = nil;
    NSString *html = [NSString stringWithContentsOfURL:urlRequest encoding:NSUTF8StringEncoding error:&err];
    
    
    NSString *temp = [html substringFromIndex:[html rangeOfString:@"temp"].location + 6];
    NSString *revisedTemp = [temp substringToIndex:6];
    
    int fahrenheitFromKelvin = (((revisedTemp.integerValue)*9)/5) - 459.67;
    int celsiusFromKelvin = revisedTemp.integerValue - 273.15;
    
    
    

    int sliderValue = (int) self.tempControl.value;
    int convert;
    if (self.unitSelector.selectedSegmentIndex == 0){
        convert = ((sliderValue * 9)/5) + 32;
        self.tempControl.value = convert;
        self.tempDisplay.text = [NSString stringWithFormat:@"%i°",convert];
        self.currentTemp.text = [NSString stringWithFormat:@"%d°",fahrenheitFromKelvin];
        
    }
    else if (self.unitSelector.selectedSegmentIndex == 1){
        convert = (((sliderValue - 32) * 5)/9);
        self.tempControl.value = convert;
        self.tempDisplay.text = [NSString stringWithFormat:@"%i°",convert];
        self.currentTemp.text = [NSString stringWithFormat:@"%d°",celsiusFromKelvin];
    }
    
    
}



@end
