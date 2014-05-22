//
//  PieChartViewController.m
//  CaffeineFix
//
//  Created by IM IX on 22/5/14.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import "CFIXPieChartViewController.h"

@interface PieChartViewController ()

@end

@implementation PieChartViewController

@synthesize pieChartView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    
    for (int i=0; i < 7; i++) {
        //Creates random number
        NSNumber *number = [NSNumber numberWithInt:rand()%60+20];
        
        [dataArray addObject:number];
    }
    
    [self.pieChartView renderInLayer: self.pieChartView dataArray:dataArray];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
