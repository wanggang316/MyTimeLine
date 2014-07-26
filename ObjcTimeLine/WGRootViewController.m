//
//  ASRDialogViewController.m
//  MSCDemo
//
//  Created by junmei on 14-1-20.
//  Copyright (c) 2014年 iflytek. All rights reserved.
//

#import "WGRootViewController.h"
#import "Definition.h"
#import "UIPlaceHolderTextView.h"
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlySpeechUtility.h"
#import "iflyMSC/IFlyRecognizerView.h"
#import "PopupView.h"
#import "ObjcTimeLine-Swift.h"


@class ItemTableViewCell;

static NSString * const TimeCellIdentifier = @"TimeCellIdentifier";

@interface WGRootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *timeLineTableView;
@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation WGRootViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self setupRecognizer];
    
    [self.view addSubview:self.timeLineTableView];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [IFlySpeechUtility destroy];
    [super viewWillDisappear:animated];
}

- (NSArray *)dataSource {

    if (!_dataSource) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"valio" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
        _dataSource = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    }
    return _dataSource;
    
}

- (UITableView *)timeLineTableView {
    if (!_timeLineTableView) {
        _timeLineTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _timeLineTableView.delegate = self;
        _timeLineTableView.dataSource = self;

//        Class clazz =;
        [_timeLineTableView registerClass:[ItemTableViewCell class] forCellReuseIdentifier:TimeCellIdentifier];
        _timeLineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _timeLineTableView;
}


- (void)setupRecognizer {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(130, 400, 60, 50);
    [button setTitle:@"开始识别" forState:UIControlStateNormal];
    [button setTitle:@"开始识别" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(startListenning:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _popView = [[PopupView alloc] initWithFrame:CGRectMake(100, 300, 0, 0)];
    _popView.ParentView = self.view;
    
    //初始化语音识别控件
    NSString *initString = [NSString stringWithFormat:@"%@=%@",[IFlySpeechConstant APPID],APPID_VALUE];
    
    //所有服务启动前，需要确保执行createUtility
    [IFlySpeechUtility createUtility:initString];
    
    self.iflyRecognizerView= [[IFlyRecognizerView alloc] initWithCenter:self.view.center];
    _iflyRecognizerView.delegate = self;
    
    [_iflyRecognizerView setParameter: @"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
    [_iflyRecognizerView setParameter: @"asr.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    
    // | result_type   | 返回结果的数据格式，可设置为json，xml，plain，默认为json。
    [_iflyRecognizerView setParameter:@"plain" forKey:[IFlySpeechConstant RESULT_TYPE]];
    
    //    [_iflyRecognizerView setParameter:@"asr_audio_path" value:nil];   当你再不需要保存音频时，请在必要的地方加上这行。
}

/**
 启动按钮响应方法
 */
- (void)startListenning:(id)sender
{
    [_iflyRecognizerView start];
    NSLog(@"start listenning...");
}

#pragma mark IFlyRecognizerViewDelegate
/** 识别结果回调方法
 @param resultArray 结果列表
 @param isLast YES 表示最后一个，NO表示后面还有结果
 */
- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic) {
        [result appendFormat:@"%@",key];
    }
    NSLog(@"------>%@",result);
 }

/** 识别结束回调方法
 @param error 识别错误
 */
- (void)onError:(IFlySpeechError *)error
{
    [self.view addSubview:_popView];
    [_popView setText:[NSString stringWithFormat:@"识别结束,错误码:%d",[error errorCode]]];
    NSLog(@"errorCode:%d",[error errorCode]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSDictionary *day = [self.dataSource objectAtIndex:section];
    NSArray *items = [day objectForKey:@"items"];
    return items.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ItemTableViewCell *cell = (ItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:TimeCellIdentifier forIndexPath:indexPath];
    
    NSDictionary *day = [self.dataSource objectAtIndex:indexPath.section];
    NSArray *items = [day objectForKey:@"items"];
    NSDictionary *item = [items objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = [item objectForKey:@"title"];
    cell.timeLabel.text = [item objectForKey:@"time"];
    BOOL minor = (BOOL)[item objectForKey:@"minor"];
    if (minor) {
        cell.minor = minor;
    } else {
        cell.minor = NO;
    }
    
    return cell;
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    NSDictionary *day = [self.dataSource objectAtIndex:section];
    return [day objectForKey:@"title"];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    NSDictionary *day = [self.dataSource objectAtIndex:section];
    SectionHeaderView *view = [[SectionHeaderView alloc]init];
    view.titleLabel.text = [[day objectForKey:@"title"] uppercaseString];
    return view;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

@end
