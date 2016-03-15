//
//  ViewController.m
//  GHPay-demo
//
//  Created by shen_gh on 16/3/15.
//  Copyright © 2016年 com.joinup(Beijing). All rights reserved.
//

#import "ViewController.h"
#import "GHPayTableViewCell.h"
#import "UIImage+Utils.h"

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArr;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *footerView;
@end

#define kBgColor [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1]

@implementation ViewController

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr=@[@{@"icon":@"ApplePay",@"name":@"Apple Pay",@"des":@"默认苹果支付"},@{@"icon":@"AliPay",@"name":@"支付宝支付",@"des":@"推荐有支付宝帐号的用户使用"},@{@"icon":@"WechatPay",@"name":@"微信支付",@"des":@"推荐安装微信5.0及以上用户使用"}];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0.0, 20.0, self.view.frame.size.width, self.view.frame.size.height-20.0) style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setRowHeight:80.0];
        [_tableView setSectionFooterHeight:100.0];
        [_tableView setBackgroundColor:kBgColor];
        [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];

        //cell无数据时，不显示间隔线
        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
        [_tableView setTableFooterView:v];
    }
    return _tableView;
}

#pragma mark - FooterView
- (UIView *)footerView{
    if (!_footerView) {
        _footerView=[[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 100.0)];
        [_footerView setBackgroundColor:[UIColor clearColor]];
        
        //确认支付btn
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(10.0, 20.0, self.view.bounds.size.width-20.0, 50.0)];
        [btn.layer setBorderWidth:0.5];
        [btn.layer setBorderColor:[UIColor grayColor].CGColor];
        [btn.layer setCornerRadius:5.0];
        [btn.layer setMasksToBounds:YES];
        [btn setBackgroundImage:[UIImage imageFormColor:[UIColor whiteColor] frame:btn.bounds] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageFormColor:kBgColor frame:btn.bounds] forState:UIControlStateHighlighted];
        [btn setTitle:@"确认支付 (￥0.66)" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_footerView addSubview:btn];
        
        UILabel *desLabel=[[UILabel alloc]initWithFrame:CGRectMake(0.0, btn.frame.origin.y+btn.frame.size.height+10.0, _footerView.frame.size.width, 15.0)];
        [desLabel setTextAlignment:NSTextAlignmentCenter];
        [desLabel setTextColor:[UIColor lightGrayColor]];
        [desLabel setText:@"注: 真实支付环境，支付成功后可联系coder退还"];
        [desLabel setFont:[UIFont systemFontOfSize:10.0]];
        [_footerView addSubview:desLabel];
    }
    return _footerView;
}

#pragma mark - UITableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArr count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了: %@",[self.dataArr[indexPath.row] valueForKey:@"name"]);
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.footerView;
}
#pragma mark - UITableView dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIde=@"cellIde";
    GHPayTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIde];
    if (!cell) {
        cell=[[GHPayTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIde];
    }
    [cell.imageView setImage:[UIImage imageNamed:[self.dataArr[indexPath.row] valueForKey:@"icon"]]];
    [cell.textLabel setText:[self.dataArr[indexPath.row] valueForKey:@"name"]];
    [cell.textLabel setTextColor:[UIColor darkGrayColor]];
    [cell.detailTextLabel setText:[self.dataArr[indexPath.row] valueForKey:@"des"]];
    [cell.detailTextLabel setTextColor:[UIColor lightGrayColor]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
