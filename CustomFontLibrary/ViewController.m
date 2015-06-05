//
//  ViewController.m
//  字体样式展示
//
//  Created by chunfeng on 15/6/5.
//  Copyright (c) 2015年 chunfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *groupedArr;
    NSMutableArray *cellArr;
}
@property (nonatomic, strong) UITableView *tableV;

@end

@implementation ViewController
- (void)loadView{
    [super loadView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableV = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableV.delegate = self;
    _tableV.dataSource = self;
    [self.view addSubview:_tableV];
    
    groupedArr = [NSMutableArray array];
    
    NSArray *arr = @[@"BaoliSCRegular"];
    NSDictionary *hdiat = @{@"groupedTitle" : @"报隶－简", @"cellTitle" : arr};
    [groupedArr addObject:hdiat];
    
    NSArray *arr1 = @[@"MicrosoftYaHei"];
    NSDictionary *hdiat1 = @{@"groupedTitle" : @"微软雅黑", @"cellTitle" : arr1};
    [groupedArr addObject:hdiat1];
    
    NSArray *arr2 = @[@"Fangsong"];
    NSDictionary *hdiat2 = @{@"groupedTitle" : @"仿宋", @"cellTitle" : arr2};
    [groupedArr addObject:hdiat2 ];
    
    NSArray *arr3 = @[@"STLITI"];
    NSDictionary *hdiat3 = @{@"groupedTitle" : @"华文隶书", @"cellTitle" : arr3};
    [groupedArr addObject:hdiat3];
    
    
    NSArray *arr4 = @[@"Lantinghei"];//, @"STLITI", @"Fangsong", @"MicrosoftYaHei",@"BaoliSCRegular"
    NSDictionary *hdiat4 = @{@"groupedTitle" : @"兰亭黑－简", @"cellTitle" : arr4};
    [groupedArr addObject:hdiat4];
    
    NSArray *arr5 = @[@"STXingkai"];//, @"STLITI", @"Fangsong", @"MicrosoftYaHei",@"BaoliSCRegular"
    NSDictionary *hdiat5 = @{@"groupedTitle" : @"华文行楷", @"cellTitle" : arr5};
    [groupedArr addObject:hdiat5];
    
    NSArray *arr6 = @[@"STXinwei"];//, @"STLITI", @"Fangsong", @"MicrosoftYaHei",@"BaoliSCRegular"
    NSDictionary *hdiat6 = @{@"groupedTitle" : @"华文新魏", @"cellTitle" : arr6};
    [groupedArr addObject:hdiat6];
    
    
    NSArray *arr7 = @[@"STHupo"];//, @"STLITI", @"Fangsong", @"MicrosoftYaHei",@"BaoliSCRegular"
    NSDictionary *hdiat7 = @{@"groupedTitle" : @"华文琥珀", @"cellTitle" : arr7};
    [groupedArr addObject:hdiat7];
    
    
    
    
    for(NSString *familyName in [UIFont familyNames]){
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:familyName forKey:@"groupedTitle"];
        
        NSLog(@"Font FamilyName = %@",familyName); //*输出字体族科名字
        
        cellArr = [NSMutableArray array];
        for(NSString *fontName in [UIFont fontNamesForFamilyName:familyName]){
            NSLog(@"\t%@",fontName);         //*输出字体族科下字样名字
            [cellArr addObject:fontName];
        }
        
        [dict setObject:cellArr forKey:@"cellTitle"];
        [groupedArr addObject:dict];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return groupedArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dict = groupedArr[section];
    
    return [dict[@"cellTitle"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"myPracticeCellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    NSString *str = groupedArr[indexPath.section][@"cellTitle"][indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:str size:12.0f];
    cell.textLabel.text = str;
    cell.detailTextLabel.font = [UIFont fontWithName:str size:20.0f];
    cell.detailTextLabel.text = @"这就是字体样式";
    cell.textLabel.textColor = color;
    cell.detailTextLabel.textColor = color;
    return cell;
}

#pragma mark 第section组显示的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * title = groupedArr[section][@"groupedTitle"];

//    return province.header;
    return title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 50;
    }
    return 8;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
