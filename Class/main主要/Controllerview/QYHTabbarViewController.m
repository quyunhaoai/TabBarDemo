//
//  QYHTabbarViewController.m
//  TabBarDemo
//
//  Created by hao on 17/9/15.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "QYHTabbarViewController.h"
#import "QYHOneViewController.h"
#import "QYHTwoViewController.h"
#import "QYHThreeViewController.h"
#import "QYHFiveViewController.h"
#import "QYHFourTableViewController.h"
#import "QYHCustomTabBar.h"
#import "QYHBaseNavigationViewController.h"
@interface QYHTabbarViewController ()<QYHCustomDelegate>
@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation QYHTabbarViewController
-(NSMutableArray *)items{

    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}
+(void)load{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildview];
    
    [self setupTabBar];
    
    
}
#pragma mark --QYHCustomTabBarDeletage
-(void)tabBar:(QYHCustomTabBar *)tabBar index:(NSUInteger)index{
    self.selectedIndex = index;
}
-(void)setupTabBar{
    [self.tabBar removeFromSuperview];
    
    QYHCustomTabBar *tabBar = [[QYHCustomTabBar alloc]initWithFrame:self.tabBar.frame ];
//    tabBar.backgroundColor = [UIColor grayColor];
    [self.view addSubview:tabBar];
    tabBar.items = self.items;
    tabBar.delegate = self;
}

-(void)setupChildview{
    
    
    QYHOneViewController *one = [[QYHOneViewController alloc] init];
    QYHBaseNavigationViewController *nav = [[QYHBaseNavigationViewController alloc] initWithRootViewController:one];
    [self setupOneViewController:nav image:[UIImage imageNamed:@"db_1"] selectImage:[UIImage imageNamed:@"db_1a"] title:@"one"];
    
    QYHTwoViewController *two = [[QYHTwoViewController alloc]init];
    two.view.backgroundColor = [UIColor blueColor];
    [self setupOneViewController:two image:[UIImage imageNamed:@"db_2"] selectImage:[UIImage imageNamed:@"db_2a"] title:@"two"];
    
    QYHThreeViewController *three = [[QYHThreeViewController alloc]init];
    three.view.backgroundColor = [UIColor yellowColor];
    [self setupOneViewController:three image:[UIImage imageNamed:@"db_3"] selectImage:[UIImage imageNamed:@"db_3a"] title:@"three"];
    
    QYHFourTableViewController *four = [[QYHFourTableViewController alloc]init];
    four.view.backgroundColor = [UIColor greenColor];
    [self setupOneViewController:four image:[UIImage imageNamed:@"db_4"] selectImage:[UIImage imageNamed:@"db_4a"] title:@"four"];
    
    QYHFiveViewController *fiveView = [[QYHFiveViewController alloc]init];
    fiveView.view.backgroundColor = [UIColor orangeColor];
    [self setupOneViewController:fiveView image:[UIImage imageNamed:@"db_5"] selectImage:[UIImage imageNamed:@"db_5a"] title:@"five"];


}
-(void)setupOneViewController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title;
{
    [self addChildViewController:vc];
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    vc.tabBarItem.title =title;
    [self.items addObject:vc.tabBarItem];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
