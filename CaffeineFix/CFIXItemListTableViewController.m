//
//  CFIXItemListTableViewController.m
//  CaffeineFix
//
//  Created by Fuggle on 20/04/2014.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import "CFIXAppDelegate.h"
#import "CFIXItemListTableViewController.h"
#import "CFIXNewItem.h"
#import "CFIXAddNewItemViewController.h"
#import "DrinkList.h"
#import "Log.h"

@interface CFIXItemListTableViewController ()

@property NSMutableArray *caffeineItems;

@end

@implementation CFIXItemListTableViewController
@synthesize managedObjectContext = _managedObjectContext;
@synthesize drinkList;
@synthesize drinkLog;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    CFIXAddNewItemViewController *source = [segue sourceViewController];
    CFIXNewItem *item = source.item;
    if (item != nil) {
        DrinkList *drinks = [NSEntityDescription
                             insertNewObjectForEntityForName:@"DrinkList"
                             inManagedObjectContext:self.managedObjectContext];
        drinks.drinkName = item.itemName;
        drinks.drinkType = item.itemType;
        drinks.caffMg = item.itemCaff;
        
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"DrinkList"
                                                  inManagedObjectContext:self.managedObjectContext];
        [fetchRequest setEntity:entity];
        
        self.drinkList = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        //[self.drinks addObject:item];
        [self.tableView reloadData];
    }
}


- (void)loadInitialData {

}

-(NSManagedObjectContext *)managedObjectContext {
    
    if (!_managedObjectContext) {
        
        CFIXAppDelegate *myAppDelegate = [[CFIXAppDelegate alloc]init];
        _managedObjectContext = myAppDelegate.managedObjectContext;
    }
    
    return _managedObjectContext;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.drinkList = [[NSMutableArray alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //Read from drinks list here.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DrinkList"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    self.drinkList = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    self.title = @"Drink List";
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.drinkList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@" drew cells: %@", self.drinkList);
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Set up the cell...
    DrinkList *info = [self.drinkList objectAtIndex:indexPath.row];
    cell.textLabel.text = info.drinkName;
    
    //old code...
    /*CFIXNewItem *items = [self.caffeineItems objectAtIndex:indexPath.row];
    cell.textLabel.text = items.itemName;
    
    if (items.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }*/
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    //<#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    //[self.navigationController pushViewController:detailViewController animated:YES];
}*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CFIXNewItem *tappedItem = [self.caffeineItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    //add to log
    Log *drinkLog = [NSEntityDescription
                         insertNewObjectForEntityForName:@"Log"
                         inManagedObjectContext:self.managedObjectContext];
    drinkLog.drink = cell.textLabel.text;
    drinkLog.drinkType = @"Coffee";
    drinkLog.caffMg = [NSNumber numberWithInt:190];
    drinkLog.time = [[NSDate alloc] init];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"LoggedDrink"])
    {
        NSLog(@" segue id: %@", segue.identifier);
    }
}

@end
