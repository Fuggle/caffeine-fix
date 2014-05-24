//
//  CFIXItemListTableViewController.h
//  CaffeineFix
//
//  Created by Fuggle on 20/04/2014.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFIXItemListTableViewController : UITableViewController
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,strong) NSArray* drinkList;
@property (weak, nonatomic) IBOutlet UITableViewCell *selectedDrink;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
