//
//  AddGoodsController.m
//  ATN
//
//  Created by 吴明飞 on 16/5/7.
//  Copyright © 2016年 王赛. All rights reserved.
//

#import "AddGoodsController.h"
#import "AddGoodsView.h"
#import "GoodsModel.h"
@interface AddGoodsController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) AddGoodsView *goodsView;

@end

@implementation AddGoodsController

{
    BOOL _isSubmit;
    BOOL _isChange;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义视图
    [self setupViews];
    //添加导航按钮
    [self customNaviBar];
    
    //获取数据
    [self requestData];
}

- (void)setupViews {
    self.title = @"添加商品";
    self.goodsView = [[AddGoodsView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.goodsView];
    //商品图片添加按钮点击事件
    [_goodsView.goodsImageBtn addTarget:self action:@selector(goodsImageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)customNaviBar {
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submitInformationAction:)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = right;
    
}

- (void)requestData {

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://123.56.77.171/app%@", self.model.url]];
    [_goodsView.goodsImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    _goodsView.goodsNameTF.text = self.model.name;
    _isChange = YES;
    
}

#pragma mark -提交商品信息
- (void)submitInformationAction:(UIBarButtonItem *)sender {
    
    if (_goodsView.goodsImageView.image == nil) {
        ShowAlertView(@"请选择图片");
        return;
    }
    if (_goodsView.goodsNameTF.text.length == 0) {
        ShowAlertView(@"请输入商品名称");
        return;
    }
    if (_goodsView.goodsPriceTF.text.length == 0) {
        ShowAlertView(@"请填写价格");
        return;
    }
    
    if (_isSubmit) {
        
        [self addGoods];

        
    } else if (_isChange) {
        
        [self alertGoods];
        
    }
    
}

//新增商品
- (void)addGoods{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:_goodsView.goodsNameTF.text forKey:@"name"];
    
    NSString *urlString = @"http://123.56.77.171/app/shop/product";
    NSString *urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:urlStr parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSData *imageData = UIImageJPEGRepresentation(_goodsView.goodsImageView.image, 0.3);
        [formData appendPartWithFileData:imageData name:@"portrait" fileName:@"image.jpg" mimeType:@"image/jpg"];
        
    } error:nil];
    
    
    [SVProgressHUD dismiss];
    [SVProgressHUD showErrorWithStatus:@"图片提交失败"];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    
    [SVProgressHUD show];
    
    NSString *value = [NSString stringWithFormat:@"%@", [UserModel defaultModel].user.token];
    
    [request addValue:value forHTTPHeaderField:@"Authorization"];
    
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress *uploadProgress) {
        
    } completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        [SVProgressHUD dismiss];
        if (responseObject) {
            
            NSLog(@"%@", responseObject);
            
        } else {
            
            [SVProgressHUD dismiss];
            ShowAlertView(@"上传图片失败");
            
        }
        
    }];
    [uploadTask resume];

    
}

//修改商品
- (void)alertGoods {
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:_goodsView.goodsNameTF.text forKey:@"name"];
    
    NSString *urlString = [NSString stringWithFormat:@"http://123.56.77.171/app/shop/product/%@", self.model.id];
    NSString *urlStr = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"PUT" URLString:urlStr parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSData *imageData = UIImageJPEGRepresentation(_goodsView.goodsImageView.image, 0.3);
        [formData appendPartWithFileData:imageData name:@"portrait" fileName:@"image.jpg" mimeType:@"image/jpg"];
        
    } error:nil];
    
    
    [SVProgressHUD dismiss];
    [SVProgressHUD showErrorWithStatus:@"图片提交失败"];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
   
    
    [SVProgressHUD show];
    
    NSString *value = [NSString stringWithFormat:@"%@", [UserModel defaultModel].user.token];
    
    [request addValue:value forHTTPHeaderField:@"Authorization"];
    
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress *uploadProgress) {
        
    } completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        [SVProgressHUD dismiss];
        if (responseObject) {
            
            NSLog(@"%@", responseObject);
            
        } else {
            
            [SVProgressHUD dismiss];
            ShowAlertView(@"上传图片失败");
            
        }
        
    }];
    [uploadTask resume];

    
}

#pragma mark -商品图片
- (void)goodsImageBtnAction:(UIButton *)sender {
    
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (image == nil)
    {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    _goodsView.goodsImageView.image = image;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
