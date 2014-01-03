//
//  ViewController.m
//  ColorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *colorView;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController

- (IBAction)powerOnOff:(id)sender {
    BOOL isOn = ((UISwitch *)sender).on;
    
    self.redSlider.enabled = isOn;
    self.greenSlider.enabled = isOn;
    self.blueSlider.enabled = isOn;
    
//    [self offColorSliderChangedWithStartNumber:1 WithLastNumber:3 WithOnOff:isOn];
    
    if (isOn) {
        [self.activityIndicator startAnimating];
        //1초 뒤에 현재 색상으로 변경
        [self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0];
    }else {
        self.colorView.backgroundColor = [UIColor grayColor];
    }
}

//- (void)offColorSliderChangedWithStartNumber:(int)startNum WithLastNumber:(int)lastNum WithOnOff:(BOOL)isOn{
//    
//    for (int i = startNum; i <= lastNum; i++) {
//        UISlider *slider = (UISlider *)[self.view viewWithTag:i];
//        slider.enabled = isOn;
//    }
//}

- (IBAction)onColorSliderChanged:(id)sender {
    //indicator 켜져있으면 끄기
    if ([self.activityIndicator isAnimating]) {
        [self.activityIndicator stopAnimating];
    }
    self.colorView.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1.0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.activityIndicator.hidesWhenStopped = YES;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self onColorSliderChanged:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
