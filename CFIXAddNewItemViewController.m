//
//  CFIXAddNewItemViewController.m
//  CaffeineFix
//
//  Created by Fuggle on 20/04/2014.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import "CFIXAddNewItemViewController.h"
#import "CorePlot-CocoaTouch.h"
#import "CFIXAppDelegate.h"
#import "DrinkList.h"

@interface CFIXAddNewItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation CFIXAddNewItemViewController
@synthesize managedObjectContext = _managedObjectContext;
@synthesize drinkList;

-(NSManagedObjectContext *)managedObjectContext {
    
    if (!_managedObjectContext) {
        
        CFIXAppDelegate *myAppDelegate = [[CFIXAppDelegate alloc]init];
        _managedObjectContext = myAppDelegate.managedObjectContext;
    }
    
    return _managedObjectContext;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.textField.text.length > 0) {
        self.item = [[CFIXNewItem alloc] init];
        self.item.itemName = self.textField.text;
        self.item.completed = NO;
    }
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
