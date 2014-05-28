//
//  CFIXViewController.h
//  CaffeineFix
//
//  Created by Huang Jiewei on 22/05/14.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFIXViewController : UIViewController
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, strong)NSArray * drinklog;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
