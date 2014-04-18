//
//  ViewController.m
//  test18
//
//  Created by macbook_006 on 4/18/14.
//  Copyright (c) 2014 framgia. All rights reserved.
//
#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIButton *imageView;
//@property(nonatomic,strong)  NSString *avatar;
@property(nonatomic,strong)UIImageView *avatar_View;
@end

@implementation ViewController

- (void)viewDidLoad
{
    delegate=[NSUserDefaults standardUserDefaults];
    NSString *teacherDir;
    NSArray *dirPaths1;
    NSString *studentDir;
    // Get the documents directory
    dirPaths1 = NSSearchPathForDirectoriesInDomains(
                                                    NSDocumentDirectory, NSUserDomainMask, YES);
    teacherDir = dirPaths1[0];
    studentDir = dirPaths1[0];
    NSLog(@"%@",teacherDir);
    NSLog(@"%@",studentDir);
    // Build the path to the database file
    /*
    _databasePath1 = [[NSString alloc]
                      initWithString: [teacherDir stringByAppendingPathComponent:
                                       @"teacher.db"]];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: _databasePath1 ] == NO)
    {
        const char *dbpath = [_databasePath1 UTF8String];
        
        if (sqlite3_open(dbpath, &_teacherDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS(ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT)";
            
            if (sqlite3_exec(_teacherDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                _status.text = @"Failed to create table";
            }
            sqlite3_close(_teacherDB);
        } else {
            _status.text = @"Failed to open/create database";
        }
    }
    */
    
    //Student
    // Build the path to the database file
    _databasePath2 = [[NSString alloc]
                      initWithString: [studentDir stringByAppendingPathComponent:
                                       @"student.db"]];
    NSFileManager *filemgr2 = [NSFileManager defaultManager];
    
    if ([filemgr2 fileExistsAtPath: _databasePath2 ] == NO)
    {
        const char *dbpath2 = [_databasePath2 UTF8String];
        
        if (sqlite3_open(dbpath2, &_studentDB) == SQLITE_OK)
        {
            char *errMsg2;
            const char *sql_stmt2 =
            "CREATE TABLE IF NOT EXISTS Student (ID INTEGER PRIMARY KEY AUTOINCREMENT, student_Name,phone,mobile,birthday_day,birthday_month,birthday_year,emailT)";
            
            if (sqlite3_exec(_studentDB, sql_stmt2, NULL, NULL, &errMsg2) != SQLITE_OK)
            {
                _status.text = @"Failed to create table";
            }
            sqlite3_close(_studentDB);
        } else {
            _status.text = @"Failed to open/create database";
        }
    }
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) save:(id)sender
{/*
    //Teacher
    //sqlite3_stmt    *statement;
    const char *dbpath1 = [_databasePath1 UTF8String];
    
    if (sqlite3_open(dbpath1, &_teacherDB) == SQLITE_OK)
    {
        
        NSString *str1;
        str1=_teacher_Name.text;
        
        NSString *insertSQL1 = [NSString stringWithFormat: @"INSERT INTO Teacher(name) VALUES (\"%@\")",str1];
        const char *insert_stmt1 = [insertSQL1 UTF8String];
        sqlite3_prepare_v2(_teacherDB, insert_stmt1,
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            _status.text = @"Teacher added";
            _teacher_Name.text = @"";
        } else {
            _status.text = @"Failed to add";
        }
        sqlite3_finalize(statement);
        sqlite3_close(_teacherDB);
    }
    */
    
    //Student
 sqlite3_stmt    *statement1;
    const char *dbpath2 = [_databasePath2 UTF8String];
    NSString *str2=_student_Name.text;

    NSString *str3=_phone.text;
    
    NSString *str4=_mobile.text;
    
    NSString *str5=_birthday_day.text;
    
    NSString *str6=_birthday_month.text;
    
    NSString *str7=_birthday_year.text;
    
    NSString *str8=_email.text;
    
   // NSString *str9=_gender_Student;
    
   // NSString *str10=[delegate objectForKey:@"imagr_ID"];
    NSString *insertSQL2 = [NSString stringWithFormat: @"INSERT INTO Student(student_Name,phone,mobile,birthday_day,birthday_month,birthday_year,email) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",str2,str3,str4,str5,str6,str7,str8];
    
    const char *insert_stmt2 = [insertSQL2 UTF8String];
    sqlite3_prepare_v2(_studentDB, insert_stmt2,
                       -1, &statement1, NULL);
    if (sqlite3_open(dbpath2, &_studentDB) == SQLITE_OK)
    {
        if (sqlite3_step(statement1) == SQLITE_DONE)
        {
            _status.text = @"Contact added";
            _student_Name.text = @"";
            _phone.text = @"";
            _mobile.text = @"";
            _birthday_day.text = @"";
            _birthday_month.text = @"";
            _birthday_year.text = @"";
            _email.text = @"";
        } else {
            _status.text = @"Failed to add ";
        }
        sqlite3_finalize(statement1);
        sqlite3_close(_studentDB);
    }
    
}

- (void) find:(id)sender
{
    // sqlite3_stmt    *statement;
    //Teacher
    /*
    const char *dbpath1 = [_databasePath1 UTF8String];
    
    if (sqlite3_open(dbpath1, &_teacherDB) == SQLITE_OK)
    {
        NSString *querySQL1 = [NSString stringWithFormat:
                               @"SELECT FROM teacherDB WHERE name=\"%@\"",
                               _teacher_Name.text];
        
        const char *query_stmt1 = [querySQL1 UTF8String];
        
        if (sqlite3_prepare_v2(_teacherDB,
                               query_stmt1, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                [self findAtRow:0];
                _teacher_Name.text = _addressField;
                _status.text = @"Match found";
            } else {
                _status.text = @"Match not found";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_teacherDB);
    }
    */
    
    //Student
    const char *dbpath2 = [_databasePath2 UTF8String];
    
    if (sqlite3_open(dbpath2, &_studentDB) == SQLITE_OK)
    {
        NSString *querySQL2 = [NSString stringWithFormat:
                               @"SELECT *FROM StudentDB WHERE student_Name=\"%@\"",
                               _student_Name.text];
        
        const char *query_stmt2 = [querySQL2 UTF8String];
        
        if (sqlite3_prepare_v2(_studentDB,
                               query_stmt2, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                [self findAtRow:0];
                _phone.text = _addressField;
                [self findAtRow:1];
                _mobile.text = _addressField;
                [self findAtRow:2];
                _birthday_day.text = _addressField;
                [self findAtRow:3];
                _birthday_month.text = _addressField;
                [self findAtRow:4];
                _birthday_year.text = _addressField;
                [self findAtRow:5];
                _email.text = _addressField;
                [self findAtRow:6];
                UIImage *myImage = [UIImage imageNamed:_addressField];
                self.avatar_View = [[UIImageView alloc] initWithImage:myImage];
                CGRect myFrame = CGRectMake(400.0f,
                                            600.0f,
                                            100.0f,
                                            44.0f);
                [self.avatar_View setFrame:myFrame];
                //If your image is bigger than the frame then you can scale it
                [self.view setContentMode:UIViewContentModeScaleAspectFit];
                //add the image view to the current view
                [self.view addSubview:self.avatar_View];
                _status.text = @"Match found";
            } else {
                _status.text = @"Match not found";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_studentDB);
    }
}


- (IBAction)gender:(id)sender {
    [self.gender_Text addTarget:self
                         action:@selector(segmentChanged:)
               forControlEvents:UIControlEventValueChanged];
}
- (void) segmentChanged:(UISegmentedControl *)sender{
    if ([sender isEqual:self.gender_Text]){
        NSInteger selectedSegmentIndex = [sender selectedSegmentIndex];
        _gender_Student =
        [sender titleForSegmentAtIndex:selectedSegmentIndex];
    }
}


-(void)findAtRow:(int)i{
    _addressField = [[NSString alloc]
                     initWithUTF8String:
                     (const char *) sqlite3_column_text(statement, i)];
}


@end
