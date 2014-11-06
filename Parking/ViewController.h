//
//  ViewController.h
//  Parking
//
//  Created by ishida on 2014/11/03.
//  Copyright (c) 2014年 ishida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParkingRecord.h"

@interface ViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


@end

