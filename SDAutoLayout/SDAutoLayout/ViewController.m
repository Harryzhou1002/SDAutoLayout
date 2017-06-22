//
//  ViewController.m
//  SDAutoLayout
//
//  Created by etmedia on 2017/6/20.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "ViewController.h"
#import "Model2.h"
#import "TableViewCell2.h"
#import <UIView+SDAutoLayout.h>
#import <UITableView+SDAutoTableViewCellHeight.h>
#import "AViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray *modelsArray;

@end

@implementation ViewController

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self creatModelsWithCount:10];
    self.tableView.hidden = NO;
    
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:@"Harry" forKey:@"name"];
    [userdefaults setObject:@"1234567890" forKey:@"password"];
    [userdefaults synchronize];
}

- (void)creatModelsWithCount:(NSInteger)count
{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray new];
    }
    
    
    NSArray * contentArr = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。"
                           ];
    
    NSArray * commentArr = @[@"你好，我觉得C罗离开皇家马德里的话，说实话，粉丝都会少了一大半，这就是所谓的巨星效应，不知道是为什么",
                             @"梅西跟C罗是彼此都不好分开，这就是所谓的绝代双骄，每个人都是为5座金球",
                             @"当C罗离开皇马时，也许我不再是皇马的球迷",
                             @"不错就是这样来",
                             @"莫德里奇是很厉害，克罗斯也不错，只可惜佩佩也要走了，真为他心塞。"
                             ];


    
    NSArray *picImageNamesArray = @[ @"pic0.jpg",
                                     @"pic1.jpg",
                                     @"pic2.jpg",
                                     @"pic3.jpg",
                                     @"pic4.jpg",
                                     ];
    
    for (int i = 0; i < count ; i ++) {
        
        int contentRamIndex = arc4random_uniform(5);
        int commentRamIndex = arc4random_uniform(5);
        int picRamIndex = arc4random_uniform(5);
        
        Model2 * model = [Model2 new];
        model.content = contentArr[contentRamIndex];
        model.comment = commentArr[commentRamIndex];
        model.picName = picImageNamesArray[picRamIndex];
        
        [_modelsArray addObject:model];
        
    }

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _modelsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell2 * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[TableViewCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.model = _modelsArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.tableView cellHeightForIndexPath:indexPath model:_modelsArray[indexPath.row] keyPath:@"model" cellClass:[TableViewCell2 class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AViewController * avc = [[AViewController alloc]init];
    [self presentViewController:avc animated:YES completion:nil];
}



@end
