//
//  HomeVController.m
//  @你
//
//  Created by 王赛 on 16/3/29.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "HomeVController.h"
#import "WSCommon.h"

#import "SearchViewController.h"//搜索
#import "AddressChooseViewController.h"
#import "AddressCommon.h"//定位common文件
#import "AddressChoooseView.h"

#import "CyclicImageView.h"//广告栏View
#import "ShopTVCell.h"
#import "ShoplistModel.h"
#import "ShopDetailViewController.h"


#import "AFNetworking.h"

@interface HomeVController ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>

/**搜索栏 右边消息提示按钮 */
@property (nonatomic ,strong) UIButton *rightBtn;

@property (nonatomic , strong) NSMutableArray *dataArray;
/** 背景大ScrollView */
@property (weak, nonatomic) IBOutlet UIScrollView *backScrollView;
/**  Scroll下的大背景view */
@property (weak, nonatomic) IBOutlet UIView *bigBackView;

/**  广告栏View */
@property (weak, nonatomic) IBOutlet UIView *adView;
@property (nonatomic , strong) NSMutableArray *adImagearray;/** 广告图片ID的数组 */

/**  广播栏View */
@property (weak, nonatomic) IBOutlet UIView *broadView;
@property (weak, nonatomic) IBOutlet UIImageView *broadImg;/**  广播栏image ICON */
@property (weak, nonatomic) IBOutlet UIButton *broadBtn;/**  广播栏Button  */

/**  按钮导航栏 View */
@property (weak, nonatomic) IBOutlet UIView *btnView;/**  背景view */
@property (weak, nonatomic) IBOutlet UIButton *FoodBtn;/**  美食Btn */
@property (weak, nonatomic) IBOutlet UIButton *ShopBtn;/**  购物Btn */
@property (weak, nonatomic) IBOutlet UIButton *HotelBtn;/**  酒店Btn */
@property (weak, nonatomic) IBOutlet UIButton *AmusementBtn;/**  休闲娱乐Btn */

/**  聚宝盆广告view */
@property (weak, nonatomic) IBOutlet UIView *moneyADView;/**  聚宝盆广告view */
@property (weak, nonatomic) IBOutlet UIButton *moneyADBtn;;/**  聚宝盆广告Btn */

@property (weak, nonatomic) IBOutlet UIButton *searchBarBtn;/**  搜索BarBtn */
@property (weak, nonatomic) IBOutlet UIButton *addressBarBtn;/**  位置选择BarBtn */

@property (weak, nonatomic) IBOutlet UITableView *homeTabbleview;
@property (nonatomic ,strong) NSMutableArray *shopListarray;
@property (nonatomic , strong) ShoplistModel *shoplistmodel;

/**  tabbleview假数据 */
@property (nonatomic , strong) NSMutableArray* shopImgArray ;
@property (nonatomic , strong) NSArray* shopNameArray ;
@property (nonatomic , strong) NSArray* shopKindArray ;
@property (nonatomic , strong) NSArray* shopAdressArray ;
@property (nonatomic , strong) NSArray* backMoneyArray ;

@end

@implementation HomeVController


-(NSMutableArray *)shopListarray
{
    if (_shopListarray ==nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ShopList" ofType:@"plist"];
        NSArray *models = [NSArray arrayWithContentsOfFile:path];
        _shopListarray = [NSMutableArray array];
        for (NSDictionary *dict in models) {
            ShoplistModel *shoplist = [ShoplistModel shoplistDict:dict];
            [_shopListarray addObject:shoplist];
        }
    }
    return _shopListarray;
}

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    

//
    self.view.backgroundColor = [UIColor orangeColor];
    
   
     self.addressBarBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    
    
   
    self.adView.frame = CGRectMake(0, 0, kScreenWidth, 150);
    [self setADCyclicView];
    //添加点击搜索的操作

//    [self.searchBarBtn addTarget:self action:@selector(SearchView) forControlEvents:UIControlEventTouchDown];
    
    [self setBroadBtn];
    //右侧NVB按钮设置  消息提示
   
    [self setNavgation];
    
//    [self setupData];
    [self setupSubViews];
}



/**
 *  位置
 */
- (IBAction)chooseClick:(UIButton *)sender {
    
    AddressChoooseView* dateView = [[AddressChoooseView alloc] initWithFrame:CGRectMake(0, DeviceHeight-250, DeviceWidth, 250) Data:nil];
    
    [dateView showPickerView];
    
    dateView.ActionDistrictViewSelectBlock = ^(NSString *desStr,NSDictionary *selectDistrictDict){
        //
        self.addressBarBtn.titleLabel.text = [selectDistrictDict objectForKey:Key_DistrictSelectProvinceSub];
        //        if ([Key_DistrictSelectProvinceSub isEqualToString:@"市辖区"]) {
        //            self.locationBtn.titleLabel.text = [selectDistrictDict objectForKey:Key_DistrictSelectCity];
        //        }
       
        //        self.locationBtn.titleLabel.text = [selectDistrictDict objectForKeyedSubscript:Key_DistrictSelectProvinceSub];
        //        self.provinceLabel.text = [selectDistrictDict objectForKey:Key_DistrictSelectProvince];
        //        self.cityLabel.text = [selectDistrictDict objectForKey:Key_DistrictSelectCity]//市区;
        //        self.areaLabel.text = [selectDistrictDict objectForKey:Key_DistrictSelectProvinceSub];// 县、区
        
    };
    
}



/**
 *  搜索
 */


//- (void)SearchView {
//    
//    
//    UIViewController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchVC"];
//    
//    SearchViewController *SearchVC = (SearchViewController *)searchVC;
//    
//    [self.navigationController pushViewController:SearchVC animated:YES];
//    
//}

#pragma mark -----Ad广告栏


-(void)setADCyclicView
{
   
  
    
    CyclicImageView *ADCyclicImgView = [[CyclicImageView alloc] initWithFrame:CGRectMake(0, 0, _adView.bounds.size.width, _adView.bounds.size.height)];
 
    //回掉函数 点击的几张图片
    
    [ADCyclicImgView setSelcetBlock:^(NSInteger index){
        
        NSLog(@"【cycleView】点击的%ld图片",index);
    }];
    
    NSArray *imagesURLStrings = @[
                                  @"http://imgsrc.baidu.com/forum/pic/item/a38e4566d0160924139b6cd9d40735fae7cd342d.jpg",
                                  @"http://www.txjly.com/UploadFiles/jingdian/jpg/2013/8/2013080709574122238.jpg",
                                  @"http://pic32.nipic.com/20130715/13232606_164243348120_2.jpg",
                                  @"http://pic1.nipic.com/2009-02-20/2009220135032130_2.jpg",
                                  @"http://imgsrc.baidu.com/forum/pic/item/7e3e37dfa9ec8a13c6a75501f703918fa1ecc0a0.jpg"
                                  ];
    NSArray *array1 = @[@"洗哈哈",
                        @"嘻嘻哈哈哈嘻",
                        @"哈哈哈哈哈哈哈哈哈哈",
                        @"wwwwwww",
                        @"呜呜呜呜我问问哈哈",
                        @"很好很好很"];
    
    [self.adView addSubview:ADCyclicImgView];

    [ADCyclicImgView setTitleArray:array1];
    [ADCyclicImgView setTextColor:[UIColor redColor]];
    [ADCyclicImgView setImageURLArray:imagesURLStrings];
    //
    //    [self.view addSubview:cycleView1];
    //    [cycleView1 setImageArray:array];
    //    cycleView.placeholderImage = [UIImage imageNamed:@"1.jpg"];
    

}





#pragma mark -------广播栏  broadBtn、broadImg、broadView
-(void)setBroadBtn
{
    [_broadBtn setTitle:@"设计师疯了 疯的不要不要的 喵喵" forState:UIControlStateNormal];
    [_broadBtn addTarget:self action:@selector(BroadBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

/*
 *    广播弹窗
 */

-(void)BroadBtnClick:(UIButton *)sender
{
    NSString *title = @"打酱油";
    NSString *message = @" 写字楼里写字间，写字间里程序员；程序人员写程序，又拿程序换酒钱。酒醒只在网上坐，酒醉还来网下眠；酒醉酒醒日复日，网上网下年复年。但愿老死电脑间，不愿鞠躬老板前；奔驰宝马贵者趣，公交自行程序员。别人笑我忒疯癫，我笑自己命太贱；不见满街漂亮妹，哪个归得程序员？";
    NSString *cancelButtonTitle = @"确认";
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the action.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"取消");
    }];
    
    // Add the action.
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
}

#pragma mark ---------四个导航按钮  FoodsBtn、ShopBtn、HotelBtn、AmusementBtn

- (IBAction)foodBtn:(UIButton *)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UITableViewController *vc = [sb instantiateViewControllerWithIdentifier:@"FoodTVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)shopBtn:(UIButton *)sender {


}

- (IBAction)hotelBtn:(UIButton *)sender {
}

- (IBAction)amusementBtn:(UIButton *)sender {
}

#pragma mark -- 聚宝盆广告====----moneyADBtn

-(IBAction)MoneyADBtnClick:(UIButton *)sender
{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITableViewController *moneyTVC = [sb instantiateViewControllerWithIdentifier:@"MoneyTVController"];
    [self.navigationController pushViewController:moneyTVC animated:YES];
    
    
}
#pragma mark - 设置tableView subviews

-(void) setupSubViews
{
    
    //设置数据源和代理
    self.homeTabbleview.delegate = self;
    self.homeTabbleview.dataSource = self;
    //    //注册cell
    [self.homeTabbleview registerNib:[UINib nibWithNibName:@"ShopTVCell" bundle:nil] forCellReuseIdentifier:@"ShopTVCell"];
}



/**
 *  初始化假数据
 */
//-(void) setupData
//{
//    _shopNameArray = @[@"周黑鸭（百子湾店）",@"肯德基（潘家园店）",@"海底捞（五道口店）",@"小肥羊（知春路店）",@"全聚德（三里屯店）"];
//    _shopAdressArray = @[@"朝阳-四惠东",@"朝阳-潘家园",@"海淀-五道口",@"海淀-知春路",@"朝阳-三里屯"];
//    _shopKindArray = @[@"美食-小吃",@"美食-快餐",@"美食-火锅",@"美食-火锅",@"美食-小吃"];
//    _backMoneyArray = @[@"30%",@"25%",@"28%",@"33%",@"16%"];
//    
//
//}

#pragma  mark ---随便看看

-(void)loadShop
{
    
    
    
}

#pragma mark - 设置NavigationBar
-(void)setNavgation{
    
    /**
     *  搜索
     */
    //    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-50, 10, 30, 30)];
    
    //    [_searchBarBtn setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    
    
    [_searchBarBtn addTarget:self action:@selector(SearchClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void) SearchClick:(UIButton *)btn
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITableViewController * vc = [sb instantiateViewControllerWithIdentifier:@"SearchVC"];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    // 如果进入的是当前视图控制器
    if (viewController == self) {
        // 背景设置为黑色
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:255 green:0.000 blue:0.000 alpha:1.000];
        // 透明度设置为0.1
        self.navigationController.navigationBar.alpha = 1.0f;
        // 设置为半透明
//        self.navigationController.navigationBar.translucent = YES;
//    } else {
//        // 进入其他视图控制器
//        self.navigationController.navigationBar.alpha = 1;
//        // 背景颜色设置为系统默认颜色
//        self.navigationController.navigationBar.tintColor = nil;
//        self.navigationController.navigationBar.translucent = NO;
    }
}


#pragma mark --UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.shopListarray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShopTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopTVCell" ];
   
    
    
    /**
     *  配置cell
     */
    ShoplistModel *model = _shopListarray[indexPath.row];
    
    cell.shoplistmodel = model;
   
    
    return cell;
    
}


#pragma mark --UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;

}
- ( NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

//    NSString *title = @"随便看看";
    if (section == 0) {
//        self.title = title;
        return @"随便看看";
    }

    return nil;
}


#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


#pragma mark - 选中行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   ShopDetailViewController * vc = [sb instantiateViewControllerWithIdentifier:@"ShopDetailViewController"];
    
//    ShoplistModel * model = self.dataArray[indexPath.row];
//    vc.shopId = model.shopId;
//    vc.indentify = @"3";
    [self.navigationController pushViewController:vc animated:YES];
//
}



- (void)didReceiveMemoryWarning {
  
    [super didReceiveMemoryWarning];
}



#pragma mark - MD5密码加密
//-(NSString *)md5:(NSString *)str {
//    
//    const char *cStr = [str UTF8String];
//    unsigned char result[16];
//    CC_MD5( cStr, (unsigned int)strlen(cStr), result );
//    
//    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]
//            ];
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
