//
//  DrinkList.h
//  CaffeineFix
//
//  Created by Fuggle on 21/05/2014.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DrinkList : NSManagedObject

@property (nonatomic, retain) NSString * drinkName;
@property (nonatomic, retain) NSString * drinkType;
@property (nonatomic, retain) NSNumber * caffMg;

@end
