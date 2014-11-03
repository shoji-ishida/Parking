//
//  ViewController.m
//  Parking
//
//  Created by ishida on 2014/11/03.
//  Copyright (c) 2014年 ishida. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ParkingRecord.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSource = [NSMutableArray array];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
    
    //fetch設定を生成
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([ParkingRecord class])];
    
    //sort条件を設定
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];

    self.dataSource = [managedObjectContext executeFetchRequest:fetchRequest error:nil];

    
    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection: %lu", (unsigned long)self.dataSource.count);
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath");
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //
    ParkingRecord *record = [self.dataSource objectAtIndex:indexPath.row];

    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString* date = [outputFormatter stringFromDate:record.date];
    BOOL flag = [record.state boolValue];
    NSString *state;
    if (flag == YES) {
        state =@"クルマに近づきました。";
    } else {
        state =@"クルマから離れました。";
    }
    
    NSMutableString* message = [NSMutableString string];
    [message appendString:[NSString stringWithFormat:@"時間：%@\n",date]];
    
    cell.textLabel.text = message;
    return cell;
}

@end
