//
//  ViewController.h
//  test18
//
//  Created by macbook_006 on 4/18/14.
//  Copyright (c) 2014 framgia. All rights reserved.
//
//
//  ViewController.h
//  test17
//
//  Created by macbook_006 on 4/18/14.
//  Copyright (c) 2014 framgia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface ViewController : UIViewController
{
    sqlite3_stmt    *statement;
    NSUserDefaults *delegate;
}
@property (strong, nonatomic) IBOutlet UISegmentedControl *gender_Text;
@property (strong, nonatomic) IBOutlet UITextField *teacher_Name;
@property (strong, nonatomic) IBOutlet UITextField *student_Name;
@property (strong, nonatomic) IBOutlet UITextField *birthday_day;
@property (strong, nonatomic) IBOutlet UITextField *birthday_month;
@property (strong, nonatomic) IBOutlet UITextField *birthday_year;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *mobile;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UILabel *status;
- (IBAction)gender:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)find:(id)sender;
@property (strong, nonatomic) NSString *databasePath1;
@property (strong, nonatomic) NSString *databasePath2;
@property (strong, nonatomic) NSString *gender_Student;
@property (strong, nonatomic) NSString *addressField;
@property (nonatomic) sqlite3 *teacherDB;
@property (nonatomic) sqlite3 *studentDB;
//-(void)insert:(NSString *)field_Text
//into:(sqlite3 *)db;
-(void)findAtRow:(int)i;

@end