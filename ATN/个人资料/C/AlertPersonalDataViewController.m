//
//  AlertPersonalDataViewController.m
//  @的你
//
//  Created by 吴明飞 on 16/3/15.
//  Copyright © 2016年 吴明飞. All rights reserved.
//

#import "AlertPersonalDataViewController.h"
#import "TestStatusViewController.h"
#import "AlertPersonalDataView.h"
#import "AFNetworking.h"
#import "ZHPickerView.h"
#import "UserModel.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <SystemConfiguration/SystemConfiguration.h>
@interface AlertPersonalDataViewController ()<UIImagePickerControllerDelegate,  UINavigationControllerDelegate, UITextFieldDelegate, ZHPickerViewDelegate>
@property (nonatomic, strong) AlertPersonalDataView *dataView;
@property (nonatomic, strong) UIImagePickerController *imagePicker;


@end

@implementation AlertPersonalDataViewController

{
    NSArray       *_sexArray;//存储性别的数组
    ZHPickerView  *_pickerView;
    
    UIImage *_headImage;
    
    BOOL _isHeadImageChange;
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人资料";
    [self customNaviBar];
    [self setupViews];
}

- (void)customNaviBar {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(preserveInformationAction:)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)setupViews {
    
    _sexArray = @[@"男", @"女"];
    
    _dataView = [[AlertPersonalDataView alloc] initWithFrame:self.view.bounds];
    _dataView.backgroundColor = RGB(237, 237, 237);
    
    //点击更换头像
    [_dataView.headImageBtn addTarget:self action:@selector(headPhotoImageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //选择性别按钮
    [_dataView.sexBtn addTarget:self action:@selector(sexBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //绑定手机按钮
    [_dataView.connectPhoneBtn addTarget:self action:@selector(connectPhoneBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //修改登录密码按钮
    [_dataView.alertSecretBtn addTarget:self action:@selector(alertSecretBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.view = _dataView;
}


#pragma mark -保存
- (void)preserveInformationAction:(UIBarButtonItem *)sender {
    if (_dataView.nickTF.text.length == 0) {
        ShowAlertView(@"请输入昵称");
        return;
    }
    if (_dataView.sexLabel.text.length == 0) {
        ShowAlertView(@"请选择性别");
        return;
    }
    if (_isHeadImageChange) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        //更新头像
        [self uploadHeadImage];
    } else {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        // 更新资料
        [self startUpDataUserInfo];
    }
}

//更新头像
- (void)uploadHeadImage {
    
    
        NSString *urlString = [NSString stringWithFormat:@"%@%@", Service_Url, KuploadHeadImage_url];
        
        NSString *urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
       NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"PUT" URLString:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            
            NSData *imageData = UIImageJPEGRepresentation(_dataView.headPhotoImage.image, 0.3);
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
            if (!error) {
                
                NSLog(@"%@", responseObject);
                [weakself startUpDataUserInfo];
            } else {
                
                [SVProgressHUD dismiss];
                ShowAlertView(@"上传图片失败");
                
            }
            
        }];
        [uploadTask resume];
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


//更新资料
- (void)startUpDataUserInfo {
    
}


#pragma mark -headPhotoImageBtnAction
//选择头像
- (void)headPhotoImageBtnAction:(UIButton *)sender {
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
                    imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
                    [weakself presentViewController:imagePicker animated:YES completion:nil];
                }
            }
                break;
            case 1:{
                //打开本地相册
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
                imagePicker.allowsEditing = YES;
                imagePicker.delegate = weakself;
                [weakself presentViewController:imagePicker animated:YES completion:nil];
            }
                break;
        }
    }];
}

#pragma mark -UIImagePickerControllerDelegate
// 添加图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (image == nil)
    {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    NSLog(@"kwith = %f, kheight = %f", image.size.width, image.size.height);
    
    CGSize newSize = CGSizeMake(65, 65);
    
    
    
    UIImage *newImage = [self scaleToSize:image size:newSize];
    _dataView.headPhotoImage.image = newImage;
    
    _isHeadImageChange = YES;
}

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}







- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    _imagePicker = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -选择性别
- (void)sexBtnAction:(UIButton *)sender {
    _pickerView = [[ZHPickerView alloc] initPickerViewWithArray:_sexArray isHaveNavController:NO];
    _pickerView.delegate = self;
    [_pickerView setPickerViewColor:[UIColor whiteColor]];
    _pickerView.tag = 200;
    [_pickerView show];
}

#pragma mark -connectPhoneBtnAction
- (void)connectPhoneBtnAction:(UIButton *)sender {
    TestStatusViewController *testVC = [[TestStatusViewController alloc] init];
    static NSInteger a = 1;
    testVC.index = a;
    [self.navigationController pushViewController:testVC animated:YES];
}

#pragma mark -alertSecretBtnAction
- (void)alertSecretBtnAction:(UIButton *)sender {
    TestStatusViewController *testVC = [[TestStatusViewController alloc] init];
    static NSInteger b = 0;
    testVC.index = b;
    [self.navigationController pushViewController:testVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

#pragma mark -ZHPickerViewDelegate
- (void)toolBarDonBtnHaveClick:(ZHPickerView *)pickView resultsString:(NSString *)resultString {
    _dataView.sexLabel.text = resultString;
}

@end
