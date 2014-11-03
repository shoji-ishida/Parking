//
//  ParkingRecord.h
//  Parking
//
//  Created by ishida on 2014/11/03.
//  Copyright (c) 2014年 ishida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ParkingRecord : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * state;

@end
