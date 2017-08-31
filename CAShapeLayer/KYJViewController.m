//
//  KYJViewController.m
//  CAShapeLayer
//
//  Created by djzx on 2017/3/21.
//  Copyright © 2017年 kangyuejie. All rights reserved.
//

#import "KYJViewController.h"
#import "KYJOne.h"
#import "KYJTwo.h"
@interface KYJViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong )UITableView * KYJtabview;
@property(nonatomic,strong)NSArray * KYJarraydata;
@end

@implementation KYJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"CAShapeLayer";
    [self createTabview];
    
    _KYJarraydata = @[@"金灿灿",@"画圆",@"画三角形"];
    // Do any additional setup after loading the view from its nib.
}



-(void)createTabview{
    _KYJtabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:(UITableViewStylePlain)];
    _KYJtabview.delegate = self;
    _KYJtabview.dataSource = self;
    [self.view addSubview:_KYJtabview];
    
}

#pragma  mark -------Delegate  And DataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _KYJarraydata.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * Cell = [[UITableViewCell alloc]init];
    Cell.textLabel.text = _KYJarraydata[indexPath.row];
    Cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return Cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    
    if (index ==0 ) {
        KYJOne * oneview = [[KYJOne alloc]init];
        
        oneview.Navtitle = _KYJarraydata[indexPath.row];
        
        [self.navigationController pushViewController:oneview animated:YES];
        
    }else if (index == 1){
        KYJTwo * twoview = [[KYJTwo alloc]init];
        twoview.Navtitle =  _KYJarraydata[indexPath.row];
        [self.navigationController pushViewController:twoview animated:YES];

        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - 懒加载
-(NSArray *)KYJarraydata{
    if (!_KYJarraydata) {
        _KYJarraydata = [[NSArray alloc]init];
    }
    return _KYJarraydata;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
