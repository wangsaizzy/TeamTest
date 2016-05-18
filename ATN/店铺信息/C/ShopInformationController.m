//
//  ShopInformationController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/30.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "ShopInformationController.h"
#import "PictureViewController.h"
#import "ShopInformationView.h"
#import "ZHPickerView.h"

@interface ShopInformationController ()<UIScrollViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ZHPickerViewDelegate, ChangeItemsSectionPictureArrayDelegate>
@property (nonatomic, strong) ShopInformationView *shopView;
@property (nonatomic, strong) PictureViewController *pictureVC;
@property (nonatomic, assign) BOOL isHeadImage;
@property (nonatomic, assign) BOOL isShowListImge;
@property (nonatomic, assign) BOOL isBannerImage;
@end

@implementation ShopInformationController
{
    UIImagePickerController *_picker;
    NSArray *_imageArr;
    NSInteger _imageIndex;
    
    BOOL _isChangeHeadImage;
    BOOL _isChangeListImage;
    BOOL _isChangeBannerImage;
    BOOL _isUploadShowImages;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏
    [self customNaviBar];
    //自定义view
    [self setupViews];
    
}

- (void)customNaviBar {
    self.title = @"店铺信息";
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"更改" style:UIBarButtonItemStylePlain target:self action:@selector(alertInformationAction:)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)setupViews {
    
    self.shopView = [[ShopInformationView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.shopView];
    
    self.pictureVC = [[PictureViewController alloc] init];
    self.pictureVC.delegate = self;
    [self addChildViewController:_pictureVC];
    self.view.frame = _pictureVC.view.frame;
    [self.shopView.secondView addSubview:_pictureVC.pictureCollectonView];
   
    
    //横幅按钮点击事件
    [_shopView.shopBannerBtn addTarget:self action:@selector(shopBannerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //开关控件点击事件
    [self.shopView.stateSwitch addTarget:self action:@selector(stateSwitchValueChangedAction:) forControlEvents:UIControlEventValueChanged];
    
    //头像按钮点击事件
    [self.shopView.headImageViewBtn addTarget:self action:@selector(headImageViewBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //店铺区域选择按钮
    [self.shopView.chooseAddressBtn addTarget:self action:@selector(chooseAddressBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //店铺分类选择按钮
    [self.shopView.chooseCategoryBtn addTarget:self action:@selector(chooseCategoryBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //列表展示图按钮
    [self.shopView.showListBtn addTarget:self action:@selector(showListBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //环境展示图按钮
    [self.shopView.showEnvironmentBtn addTarget:self action:@selector(showEnvironmentBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}


- (void)changeItemsSectionPictureArray:(NSMutableArray *)array index:(NSInteger)index {
    
    _imageArr = array;
    _imageIndex = index;
    _isUploadShowImages = YES;
    
    if (array.count < 4) {
        self.shopView.scrollView.contentSize = CGSizeMake(kWight, 930 * kHMulriple);
        self.shopView.secondView.frame = CGRectMake(0, 345 * kHMulriple, kWight, 140 * kHMulriple);
        self.shopView.thirdView.frame = CGRectMake(0, 500 * kHMulriple, kWight, 180 * kHMulriple);
        self.shopView.fouthView.frame = CGRectMake(0, 695 * kHMulriple, kWight, 220 * kHMulriple);
        
    } else if (array.count < 8) {
        self.shopView.scrollView.contentSize = CGSizeMake(kWight, 1000 * kHMulriple);
        self.shopView.secondView.frame = CGRectMake(0, 345 * kHMulriple, kWight, 210 * kHMulriple);
        self.shopView.thirdView.frame = CGRectMake(0, 570 * kHMulriple, kWight, 180 * kHMulriple);
        self.shopView.fouthView.frame = CGRectMake(0, 765 * kHMulriple, kWight, 220 * kHMulriple);
    } else {
        self.shopView.scrollView.contentSize = CGSizeMake(kWight, 1080 * kHMulriple);
         self.shopView.secondView.frame = CGRectMake(0, 345 * kHMulriple, kWight, 290 * kHMulriple);
        self.shopView.thirdView.frame = CGRectMake(0, 650 * kHMulriple, kWight, 180 * kHMulriple);
        self.shopView.fouthView.frame = CGRectMake(0, 845 * kHMulriple, kWight, 220 * kHMulriple);
    }
}


#pragma mark -更改按钮方法
- (void)alertInformationAction:(UIBarButtonItem *)sender {
    
    if (_shopView.shopNameTF.text.length == 0) {
        ShowAlertView(@"请输入店铺名称");
        return;
    }
    if (_shopView.chooseAddressLabel.text.length == 0) {
        ShowAlertView(@"请选择店铺区域");
        return;
    }
    if (_shopView.detailAddressTF.text.length == 0) {
        ShowAlertView(@"请输入店铺地址");
        return;
    }
    if (_shopView.chooseCategoryLabel.text.length == 0) {
        ShowAlertView(@"请选择店铺分类");
        return;
    }
    if (_shopView.phoneTF.text.length == 0) {
        ShowAlertView(@"请输入电话号码");
        return;
    }
    if (_shopView.discountTF.text.length == 0) {
        ShowAlertView(@"请输入折扣额度");
        return;
    }
    
    if (_isChangeHeadImage) {
        
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        NSString *urlString = [NSString stringWithFormat:@"http://123.56.77.171/app/shop/shop/%@/portrait", [UserModel defaultModel].user.userId];
        //更新头像
        [self uploadImageWithUrl:urlString image:_shopView.shopHeadImageView.image];
        
    } else if (_isChangeListImage) {
        
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        
        NSString *urlString = [NSString stringWithFormat:@"http://123.56.77.171/app/shop/shop/%@/thumbnail", [UserModel defaultModel].user.userId];
        
        //更新列表展示图
        [self uploadImageWithUrl:urlString image:_shopView.shopListImageView.image];
        
        
    } else if (_isChangeBannerImage) {
        
        
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        NSString *urlString = [NSString stringWithFormat:@"http://123.56.77.171/app/shop/shop/%@/banner", [UserModel defaultModel].user.userId];
        //更新横幅
        [self uploadImageWithUrl:urlString image:_shopView.shopBannerImageView.image];
        
        
    } else if (_isUploadShowImages) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        for (UIImage *image in _imageArr) {
            [self uploadShowImage:image];
        }
        
        
    } else {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        // 更新资料
        [self startUpDataUserInfo];
    }

}



//字典转字符串
- (NSString *)setDictionaryToString:(NSDictionary *)dic {
    
    NSString *keyValueFormat;
    NSMutableString *result = [NSMutableString new];
    //实例化一个key枚举器用来存放dictionary的key
    NSEnumerator *keyEnum = [dic keyEnumerator];
    id key;
    while (key = [keyEnum nextObject]) {
        keyValueFormat = [NSString stringWithFormat:@"%@=%@&",key,[dic valueForKey:key]];
        [result appendString:keyValueFormat];
    }
    return result;
}



//上传横幅图片
- (void)uploadImageWithUrl:(NSString *)url image:(UIImage *)image {
    
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"PUT" URLString:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSData *imageData = UIImageJPEGRepresentation(_shopView.shopBannerImageView.image, 0.3);
        [formData appendPartWithFileData:imageData name:@"image" fileName:@"image.jpg" mimeType:@"image/jpg"];
        
    } error:nil];
    
    
    [SVProgressHUD dismiss];
    [SVProgressHUD showErrorWithStatus:@"图片提交失败"];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    WS(weakself);
    
    [SVProgressHUD show];
    
    NSString *value = [NSString stringWithFormat:@"%@", [UserModel defaultModel].user.token];
    
    [request addValue:value forHTTPHeaderField:@"Authorization"];
    
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress *uploadProgress) {
        
    } completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        [SVProgressHUD dismiss];
        if (responseObject) {
            
            NSLog(@"%@", responseObject);
            [weakself startUpDataUserInfo];
        } else {
            
            [SVProgressHUD dismiss];
            ShowAlertView(@"上传图片失败");
            
        }
        
    }];
    [uploadTask resume];

}

//上传图片数组
- (void)uploadShowImage:(UIImage *)image {
    
    NSString *urlString = [NSString stringWithFormat:@"http://123.56.77.171/app/shop/shop/%@/album", [UserModel defaultModel].user.userId];
    
    NSString *urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"PUT" URLString:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSData *imageData = UIImageJPEGRepresentation(image, 0.3);
            [formData appendPartWithFileData:imageData name:@"image" fileName:@"image.jpg" mimeType:@"image/jpg"];
        
       
        
    } error:nil];
    
    
    [SVProgressHUD dismiss];
    [SVProgressHUD showErrorWithStatus:@"图片提交失败"];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    WS(weakself);
    
    [SVProgressHUD show];
    
    NSString *value = [NSString stringWithFormat:@"%@", [UserModel defaultModel].user.token];
    
    [request addValue:value forHTTPHeaderField:@"Authorization"];
    
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress *uploadProgress) {
        
    } completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        [SVProgressHUD dismiss];
        if (responseObject) {
            
            NSLog(@"%@", responseObject);
            NSDictionary *dict = responseObject[@"shop"];
            NSDictionary *dictone = dict[@"img"];
            NSArray *iamgeArr = dictone[@"album"];
            NSLog(@"%ld", iamgeArr.count);
            [weakself startUpDataUserInfo];
        } else {
            
            [SVProgressHUD dismiss];
            ShowAlertView(@"上传图片失败");
            
        }
        
    }];
    [uploadTask resume];

    
}

//上传商家资料
- (void)startUpDataUserInfo {
    
}

- (void)shopBannerBtnAction:(UIButton *)sender {
    _isHeadImage = NO;
    _isShowListImge = NO;
    _isBannerImage = YES;
    [self upLoadPhotosFromCameraOrGraph];
}

#pragma mark -开关方法
- (void)stateSwitchValueChangedAction:(UISwitch *)sender {
    
}

#pragma mark -头像
- (void)headImageViewBtnAction:(UIButton *)sender {
    _isHeadImage = YES;
    _isShowListImge = NO;
    _isBannerImage = NO;
    [self upLoadPhotosFromCameraOrGraph];
}

#pragma mark -店铺区域
- (void)chooseAddressBtnAction:(UIButton *)sender {
    
}

#pragma mark -店铺分类
- (void)chooseCategoryBtnAction:(UIButton *)sender {
    
}

#pragma mark -列表展示图片
- (void)showListBtnAction:(UIButton *)sender {
    _isShowListImge = YES;
    _isHeadImage = NO;
    _isBannerImage = NO;
    [self upLoadPhotosFromCameraOrGraph];
}

#pragma mark -环境展示图片
- (void)showEnvironmentBtnAction:(UIButton *)sender {
       
}

- (void)upLoadPhotosFromCameraOrGraph {
    WS(weakself)
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选取", nil];
    [actionSheet showInView:self.view withCompletionHandler:^(NSInteger buttonIndex) {
        switch (buttonIndex) {
            case 0: {
                //打开相机
                UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                    imagePicker.delegate = weakself;
                    imagePicker.allowsEditing = YES;//可编辑
                    imagePicker.sourceType = sourceType;
                    [weakself presentViewController:imagePicker animated:YES completion:nil];
                }
            }
                break;
            case 1:{
                //打开本地相册
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                imagePicker.allowsEditing = YES;
                imagePicker.delegate = weakself;
                [weakself presentViewController:imagePicker animated:YES completion:nil];
            }
                break;
        }
    }];

}

#pragma mark - UIImagePickerViewControllerDelegate
// 添加图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (image == nil)
    {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    if (_isHeadImage) {
        _shopView.shopHeadImageView.image = image;
        _isHeadImage = YES;
        _isChangeHeadImage = YES;
    }
    if (_isShowListImge) {
        _shopView.shopListImageView.image = image;
        _isShowListImge = YES;
        _isChangeListImage = YES;
    }
    
    if (_isBannerImage) {
        _shopView.shopBannerImageView.image = image;
        _isBannerImage = YES;
        _isChangeBannerImage = YES;
        
    }
    
}

#pragma mark -ZHPickerViewDelegate
- (void)toolBarDonBtnHaveClick:(ZHPickerView *)pickView resultsString:(NSString *)resultString {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
