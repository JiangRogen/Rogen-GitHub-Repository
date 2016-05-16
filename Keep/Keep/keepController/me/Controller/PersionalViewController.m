//
//  PersionalViewController.m
//  Keep
//
//  Created by TRRogen on 16/4/22.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "PersionalViewController.h"
#import "DynamicCell.h"
#import "HeadImageViewController.h"
#import "HeadCell.h"
#define CELLHEIGHT 80.0
@interface PersionalViewController (){
    NSArray<NSArray<NSDictionary*>*> *_persionalArr;
}

@end

@implementation PersionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPersionalArr];
    [self setNavigationBar];
    [self createTableView];
    [self createRefreshControllView];
}
-(void)setPersionalArr{
    _persionalArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"personal.plist" ofType:nil]];
}
//设置NavigationBar
-(void)setNavigationBar{

    self.title = @"我";
    UIImage *setImage = [[UIImage imageNamed:@"设置"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *setItem = [[UIBarButtonItem alloc]initWithImage:setImage style:UIBarButtonItemStyleDone target:self action:nil];
    setItem.imageInsets = UIEdgeInsetsMake(8, 8, 8, 8);//设置图片的EdgeInsert属性,可以设置图片的大小
    self.navigationItem.rightBarButtonItems = @[setItem];
    
}
//设置tableVie,并取代原有的tableVie
-(void)createTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor colorWithRed:230.0/255 green:238.0/255 blue:239.0/255 alpha:1];
    tableView.delegate = self;
    tableView.dataSource = self;
}

//设置刷新效果
-(void)createRefreshControllView{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    //设置加载时显示的标题文字
    [refreshControl addTarget:self action:@selector(DataDidLoad:) forControlEvents:UIControlEventValueChanged];
    NSMutableDictionary *titleAtt = [NSMutableDictionary dictionary];
    titleAtt[NSForegroundColorAttributeName] = [UIColor blackColor];
    NSAttributedString *loadTitle = [[NSAttributedString alloc]initWithString:@"Loading..." attributes:titleAtt];
    refreshControl.attributedTitle = loadTitle;
    //设置刷新时的渲染色
    refreshControl.tintColor = [UIColor grayColor];
    self.refreshControl = refreshControl;
}
-(void)DataDidLoad:(UIRefreshControl*)sender{
    if (sender.isRefreshing) {
        [self performSelector:@selector(RefreshscreenWithData:) withObject:nil afterDelay:0.5];
    }
}
-(void)RefreshscreenWithData:(NSString*)data{
    [self.refreshControl endRefreshing];
}

#pragma -mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _persionalArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _persionalArr[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
            cell = [[HeadCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil cellHeight:CELLHEIGHT];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            //添加手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHeadImageView:)];
            [((HeadCell*)cell).headImageView addGestureRecognizer:tap];


        }
        else{
            cell = [[DynamicCell alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 70)];
        }
        return cell;
    }
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _persionalArr[indexPath.section][indexPath.row][@"title"];
    cell.imageView.image = [UIImage imageNamed:_persionalArr[indexPath.section][indexPath.row][@"iconName"]];
    return cell;
    
}
//设置高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section ) {
        if (0 == indexPath.row)
            return CELLHEIGHT;
        else
            return 70;
    }
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}//设置为0,就该处就不会执行
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
//点击头像后的响应
-(void)tapHeadImageView:(UITapGestureRecognizer*)sender{
    UIImageView *iv = (UIImageView*)sender.view;
    HeadImageViewController *hiv = [[HeadImageViewController alloc]init];
    hiv.headImage =iv.image;
    hiv.modifyHeadImage = ^(UIImage *image){
        iv.image = image;
    };
    [self presentViewController:hiv animated:YES completion:nil];
}

@end
