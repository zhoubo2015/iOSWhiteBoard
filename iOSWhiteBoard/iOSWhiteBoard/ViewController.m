//
//  ViewController.m
//  iOSWhiteBoard
//
//  Created by ZhouDamon on 2017/3/24.
//  Copyright © 2017年 Damon. All rights reserved.
//

#import <EventKit/EventKit.h>
#import "ViewController.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
{
    UITableView *localTableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
//    CAShapeLayer *rectLayer = [CAShapeLayer layer];
//    rectLayer.backgroundColor = [UIColor whiteColor].CGColor;
//    CGSize screenSize = [UIScreen mainScreen].bounds.size;
//    UIBezierPath *rectPath = nil;
//    CGRect r = CGRectZero;
//    r = CGRectMake(0, 0, 200, 220);
//    rectPath = [UIBezierPath bezierPathWithRoundedRect:r cornerRadius:5.f];
//    rectLayer.path = rectPath.CGPath;
//    rectLayer.fillColor = [UIColor whiteColor].CGColor;
//    rectLayer.strokeColor = [UIColor whiteColor].CGColor;
//    [self.view.layer addSublayer:rectLayer];
    
//    localTableView = [[UITableView alloc] initWithFrame:CGRectMake(2, 2, 200-4, 220-4) style:(UITableViewStylePlain)];
//    localTableView.backgroundColor = [UIColor whiteColor];
//    localTableView.delegate = self;
//    localTableView.dataSource = self;
//    [self.view addSubview:localTableView];
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 5;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *identifier = @"popCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
//        cell.backgroundColor = [UIColor whiteColor];
//        //        cell.textLabel.tintColor = [UIColor blackColor];
//        //        cell.textLabel.frame = CGRectMake(10, 12, (_size.width - 20), (HEIGHT_OF_CELL - 12*2));
//        //TODO:
//        //cell.textLabel:it can't Full of the cell.contentView
//        CGSize screenSize = [UIScreen mainScreen].bounds.size;
//        CGFloat width = screenSize.width - 20;
//        
//        UILabel *textL = [[UILabel alloc] initWithFrame:CGRectMake(10, 12, 180-4, (44 - 12*2))];
//        textL.tintColor = [UIColor blackColor];
//        textL.backgroundColor = [UIColor whiteColor];
//        textL.textAlignment = NSTextAlignmentLeft;
//        textL.lineBreakMode = NSLineBreakByTruncatingTail;
//        textL.baselineAdjustment = UIBaselineAdjustmentNone;
//        textL.tag = 9000;
//        [cell.contentView addSubview:textL];
//        
//        cell.textLabel.hidden = YES;
//        cell.imageView.hidden = YES;
//        cell.detailTextLabel.hidden = YES;
//    }
//    //    cell.textLabel.text = @"hello world hello world hello world";
//    //    cell.textLabel.text = self.cellTitleArray[indexPath.row];
//    //    cell.imageView.image = [UIImage imageNamed:@"menu_exit"];
//    UILabel *label = [cell.contentView viewWithTag:9000];
//    if (label) {
//        label.text = @"hello world hello world hello world hello world hello world hello world";
//        //        label.text = self.cellTitleArray[indexPath.row];
//    }
//    
//    return cell;
//}

- (IBAction)addEvent2Calendar:(id)sender
{
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error){
            
            dispatch_async(dispatch_get_main_queue(), ^{
//                __strong typeof(weakSelf) strongSelf = weakSelf;
                if (error)
                {
                    NSLog(@"添加失败，请稍后重试");
//                    [strongSelf showAlert:@"添加失败，请稍后重试"];
                    
                }else if (!granted){
                    NSLog(@"不允许使用日历,请在设置中允许此App使用日历");
//                    [strongSelf showAlert:@"不允许使用日历,请在设置中允许此App使用日历"];
                    
                }else{
                    EKEvent *event  = [EKEvent eventWithEventStore:eventStore];
                    event.title     = @"iOS添加事件No";
                    event.location = @"ChinaHangZhou";
                    
                    NSDateFormatter *tempFormatter = [[NSDateFormatter alloc]init];
                    [tempFormatter setDateFormat:@"dd.MM.yyyy HH:mm"];
                    
                    event.startDate = [NSDate dateWithTimeIntervalSinceNow:60*5];
                    event.endDate   = [NSDate dateWithTimeIntervalSinceNow:60*10];
                    event.allDay = NO;
                    
                    //添加提醒
//                    if (alarmArray && alarmArray.count > 0) {
                        NSArray *alarmArray = @[@"你好", @"今天", @"需要吃好吃的"];
                        for (NSString *timeString in alarmArray) {
                            [event addAlarm:[EKAlarm alarmWithRelativeOffset:[timeString integerValue]]];
                        }
//                    }
                    
                    [event setCalendar:[eventStore defaultCalendarForNewEvents]];
                    NSError *err;
                    [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
//                    [strongSelf showAlert:@"已添加到系统日历中"];
                    NSLog(@"已添加到系统日历中");
                    
                }
            });
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
