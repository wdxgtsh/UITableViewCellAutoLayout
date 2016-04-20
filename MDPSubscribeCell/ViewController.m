//
//  ViewController.m
//  MDPSubscribeCell
//
//  Created by wdxgtsh on 16/4/20.
//  Copyright © 2016年 wdxgtsh. All rights reserved.
//

#import "ViewController.h"
#import "MDPSubscribeCell.h"
#import "MDPSubscribeModel.h"


#define MDPSubscribeCellID @"MDPSubscribeCellID"

@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataSourceArr;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark |--- UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MDPSubscribeCell * cell = [tableView dequeueReusableCellWithIdentifier:MDPSubscribeCellID];
    MDPSubscribeModel * model = [self.dataSourceArr objectAtIndex:indexPath.row];
    [cell setModel:model];
    
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    cell.contentView.backgroundColor =  [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}



#pragma mark |----- lazy load
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 180;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [_tableView registerClass:[MDPSubscribeCell class] forCellReuseIdentifier:MDPSubscribeCellID];
    }
    return _tableView;
}

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        
        NSString * str = @"sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； ";
        
        _dataSourceArr = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; i++) {
            MDPSubscribeModel * model = [[MDPSubscribeModel alloc] init];
            model.hasTag = (i % 3 == 2);
            model.title = [NSString stringWithFormat:@"%zd%@", i, [str substringToIndex:i]];
            model.content = @"";
            model.hasPic = (i % 5 == 3);
            model.type = ((i % 2 == 0) ? 1 : 2);
            [_dataSourceArr addObject:model];
        }
    }
    return _dataSourceArr;
}

@end
