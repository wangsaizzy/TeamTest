//
//  ViewController.m
//  类似QQ图片添加、图片浏览
//
//  Created by seven on 16/3/30.
//  Copyright © 2016年 QQpicture. All rights reserved.
//

#import "PictureViewController.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "PictureCollectionViewCell.h"
#import "PictureAddCell.h"
#import "ELCImagePickerController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/ALAsset.h>
#import "ShopInformationView.h"

@interface PictureViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,MJPhotoBrowserDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UICollectionViewDelegateFlowLayout, ELCImagePickerControllerDelegate>

@property (nonatomic, strong) ShopInformationView *shopView;



@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.itemsSectionPictureArray = [[NSMutableArray alloc] init];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(75, 75);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 5; //上下的间距 可以设置0看下效果
    layout.sectionInset = UIEdgeInsetsMake(5.f, 5, 5.f, 5);
    
    //创建 UICollectionView
    self.pictureCollectonView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50 * kHMulriple, self.view.frame.size.width, 85 * kHMulriple) collectionViewLayout:layout];
    
    [self.pictureCollectonView registerClass:[PictureCollectionViewCell class]forCellWithReuseIdentifier:@"cell"];
    
    [self.pictureCollectonView registerClass:[PictureAddCell class] forCellWithReuseIdentifier:@"addItemCell"];
    
    self.pictureCollectonView.backgroundColor = [UIColor whiteColor];
    self.pictureCollectonView.delegate = self;
    self.pictureCollectonView.dataSource = self;
    
    [self.view addSubview:self.pictureCollectonView];
    
}


#pragma mark - collectionView 调用方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemsSectionPictureArray.count +1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.itemsSectionPictureArray.count) {
        static NSString *addItem = @"addItemCell";
        
        UICollectionViewCell *addItemCell = [collectionView dequeueReusableCellWithReuseIdentifier:addItem forIndexPath:indexPath];
        
        return addItemCell;
    }else
    {
        static NSString *identify = @"cell";
        PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        
        cell.imageView.image = self.itemsSectionPictureArray[indexPath.row];
        
        return cell;
    }
}

//用代理
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.itemsSectionPictureArray.count) {
        if (self.itemsSectionPictureArray.count > 19) {
            return;
        }
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择", nil];
        sheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [sheet showInView:self.view];
    }else
    {
        NSMutableArray *photoArray = [[NSMutableArray alloc] init];
        for (int i = 0;i< self.itemsSectionPictureArray.count; i ++) {
            UIImage *image = self.itemsSectionPictureArray[i];
            
            MJPhoto *photo = [MJPhoto new];
            photo.image = image;
            PictureCollectionViewCell *cell = (PictureCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            photo.srcImageView = cell.imageView;
            [photoArray addObject:photo];
        }
        
        MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
        browser.photoBrowserdelegate = self;
        browser.currentPhotoIndex = indexPath.row;
        browser.photos = photoArray;
        [browser show];
        
    }
}

-(void)deletedPictures:(NSSet *)set
{
    NSMutableArray *cellArray = [NSMutableArray array];
    
    for (NSString *index1 in set) {
        [cellArray addObject:index1];
    }
    
    if (cellArray.count == 0) {
        
    }else if (cellArray.count == 1 && self.itemsSectionPictureArray.count == 1) {
        NSIndexPath *indexPathTwo = [NSIndexPath indexPathForRow:0 inSection:0];
        
        [self.itemsSectionPictureArray removeObjectAtIndex:indexPathTwo.row];
        [self.pictureCollectonView deleteItemsAtIndexPaths:@[indexPathTwo]];
    }else{
        
        for (int i = 0; i<cellArray.count-1; i++) {
            for (int j = 0; j<cellArray.count-1-i; j++) {
                if ([cellArray[j] intValue]<[cellArray[j+1] intValue]) {
                    NSString *temp = cellArray[j];
                    cellArray[j] = cellArray[j+1];
                    cellArray[j+1] = temp;
                }
            }
        }
        
        for (int b = 0; b<cellArray.count; b++) {
            int idexx = [cellArray[b] intValue]-1;
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idexx inSection:0];
            self.imageNum = indexPath.row;
            [self.itemsSectionPictureArray removeObjectAtIndex:indexPath.row];
            [self.pictureCollectonView deleteItemsAtIndexPaths:@[indexPath]];
            
            
        }
        if (_delegate && [self.delegate respondsToSelector:@selector(changeItemsSectionPictureArray:index:)]) {
            
            [self.delegate changeItemsSectionPictureArray:self.itemsSectionPictureArray index:self.imageNum];
        }

    }
        if (self.itemsSectionPictureArray.count <4) {
        self.pictureCollectonView.frame = CGRectMake(0, 50 * kHMulriple, kWight, 75 * kHMulriple);
    
    }else if (self.itemsSectionPictureArray.count <8)
    {
        self.pictureCollectonView.frame = CGRectMake(0, 50 * kHMulriple, kWight, 160 * kHMulriple);
        
    }else
    {
        self.pictureCollectonView.frame = CGRectMake(0, 50 * kHMulriple, kWight, 240 * kHMulriple);
       
    }
}

#pragma mark - 相册、相机调用方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"点击了拍照");
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            //设置拍照后的图片可被编辑
            picker.allowsEditing = YES;
            picker.sourceType = sourceType;
            
            picker.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            
            [self presentViewController:picker animated:YES completion:nil];
        }else{
            NSLog(@"模拟无效,请真机测试");
        }
        
        
        
    } else if (buttonIndex == 1) {
        NSLog(@"点击了从手机选择");
        
        ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
        elcPicker.maximumImagesCount = 20 - self.itemsSectionPictureArray.count;
        elcPicker.returnsOriginalImage = YES;
        elcPicker.returnsImage = YES;
        elcPicker.onOrder = NO;
        elcPicker.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie];
        elcPicker.imagePickerDelegate = self;
        //    elcPicker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;//过渡特效
        [self presentViewController:elcPicker animated:YES completion:nil];
    }
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    __weak PictureViewController *wself = self;
    [self dismissViewControllerAnimated:YES completion:^{
        BOOL hasVideo = NO;
        
        NSMutableArray *images = [NSMutableArray array];
        for (NSDictionary *dict in info) {
            if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto){
                if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                    UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                    [images addObject:image];
                    self.imageNum = [images indexOfObject:image];
                } else {
                    NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
                }
            } else if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypeVideo){
                if (!hasVideo) {
                    hasVideo = YES;
                }
            } else {
                NSLog(@"Uknown asset type");
            }
        }
        
        NSMutableArray *indexPathes = [NSMutableArray array];
        for (unsigned long i = wself.itemsSectionPictureArray.count; i < wself.itemsSectionPictureArray.count + images.count; i++) {
            [indexPathes addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        [wself.itemsSectionPictureArray addObjectsFromArray:images];
        
        if (_delegate && [self.delegate respondsToSelector:@selector(changeItemsSectionPictureArray:index:)]) {
            
            [self.delegate changeItemsSectionPictureArray:self.itemsSectionPictureArray index:self.imageNum];
        }
        
        // 调整集合视图的高度
        
        [UIView animateWithDuration:.25 delay:0 options:7 animations:^{
            
            if (wself.itemsSectionPictureArray.count <4) {
                wself.pictureCollectonView.frame = CGRectMake(0, 50 * kHMulriple, kWight, 75 * kHMulriple);
            }else if (wself.itemsSectionPictureArray.count <8)
            {
                wself.pictureCollectonView.frame = CGRectMake(0, 50 * kHMulriple, kWight, 160 * kHMulriple);
            }else
            {
                wself.pictureCollectonView.frame = CGRectMake(0, 50 * kHMulriple, kWight, 240 * kHMulriple);
            }
            
            [wself.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            // 添加新选择的图片
            [wself.pictureCollectonView performBatchUpdates:^{
                [wself.pictureCollectonView insertItemsAtIndexPaths:indexPathes];
            } completion:^(BOOL finished) {
                if (hasVideo) {
                    [[[UIAlertView alloc] initWithTitle:@"提示" message:@"暂不支持视频发布" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
                }
            }];
        }];
    }];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    
    [self.itemsSectionPictureArray addObject:image];
    if (_delegate && [self.delegate respondsToSelector:@selector(changeItemsSectionPictureArray:index:)]) {
        NSInteger imageCount = [self.itemsSectionPictureArray indexOfObject:image] - 1;
        [self.delegate changeItemsSectionPictureArray:self.itemsSectionPictureArray index:imageCount];
    }
    __weak PictureViewController *wself = self;
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [UIView animateWithDuration:.25 delay:0 options:7 animations:^{
            if (wself.itemsSectionPictureArray.count <4) {
                wself.pictureCollectonView.frame = CGRectMake(0, 50 * kHMulriple, kWight, 75 * kHMulriple);
                
            }else if (wself.itemsSectionPictureArray.count <8)
            {
                wself.pictureCollectonView.frame = CGRectMake(0, 50, wself.view.frame.size.width, 160);
                
            }else
            {
                wself.pictureCollectonView.frame = CGRectMake(0, 50 * kHMulriple, kWight, 240 * kHMulriple);
               
            }
            
            [wself.view layoutIfNeeded];
        } completion:nil];
        
        [self.pictureCollectonView performBatchUpdates:^{
            [wself.pictureCollectonView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:wself.itemsSectionPictureArray.count - 1 inSection:0]]];
        } completion:nil];
    }];
    
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    if (_delegate && [self.delegate respondsToSelector:@selector(changeItemsSectionPictureArray:index:)]) {
        [self.delegate changeItemsSectionPictureArray:self.itemsSectionPictureArray index:self.imageNum];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
