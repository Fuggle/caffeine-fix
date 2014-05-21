//
//  CFIXAddNewItemViewController.h
//  CaffeineFix
//
//  Created by Fuggle on 20/04/2014.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFIXNewItem.h"

@interface CFIXAddNewItemViewController : UIViewController

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,strong) NSArray* drinkList;
@property CFIXNewItem *item;

@end
