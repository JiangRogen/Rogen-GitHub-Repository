//
//  HeadImageViewController.m
//  Keep
//
//  Created by TRRogen on 16/5/7.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "HeadImageViewController.h"
#import "UIView+RoundCut.h"

@interface HeadImageViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic,weak)UIImageView *imageView;
@end

@implementation HeadImageViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    /*创建头像的imageView*/
    UIImageView *imageView = [[UIImageView alloc]init];
    CGPoint center = self.view.center;
    center.y -= 100;
    imageView.center = center;
    CGFloat edge = self.view.bounds.size.width - 20;
    imageView.bounds = CGRectMake(0, 0, edge,edge );
    imageView.userInteractionEnabled  = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = self.headImage;
    [imageView roundCutCornerRadius:30 borderWidth:1 borderColor:[UIColor lightGrayColor]];
    //添加手势到imageView
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImageView:)];
    [imageView addGestureRecognizer:tap];
    
    [self.view addSubview:imageView];
    self.imageView  = imageView;
}
//点击手势后的响应
-(void)clickImageView:(UITapGestureRecognizer*)sender{
    //创建alertAction
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cacelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    //返回上一层控制器事件
    UIAlertAction *backAction = [UIAlertAction actionWithTitle:@"Back" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //判断头像图片是否已经修改过
        if (![self.imageView.image isEqual:self.headImage]){
            [self creatSaveAlert]; //修改过就询问是否保存图片
        }
        else{
            [self dismissViewControllerAnimated:YES completion:nil]; //没有修改过就返回
        }
    }];
    //从相册中选择照片的事件
    UIAlertAction *photoLibraryAction = [UIAlertAction actionWithTitle:@"Choose In Album" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self creatImagePickerControllerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    //用相机拍照的事件
    UIAlertAction *camareAction = [UIAlertAction actionWithTitle:@"Camare" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self creatImagePickerControllerWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }];
    
    [alertController addAction:cacelAction];
    [alertController addAction:backAction];
    [alertController addAction:photoLibraryAction];
    [alertController addAction:camareAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

//创建alertAction询问是否保存已经修改的图像
-(void)creatSaveAlert{
    UIAlertController *saveAlert = [UIAlertController alertControllerWithTitle:@"Attantion" message:@"The image has already modified,Do you Want Save it?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //通过block回传修改的image
        self.modifyHeadImage(self.imageView.image);
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *notSaveAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [saveAlert addAction:saveAction];
    [saveAlert addAction:notSaveAction];
    [self presentViewController:saveAlert animated:YES completion:nil];

}


//根据源类型创建ImagePickercontroller
-(void)creatImagePickerControllerWithSourceType:(UIImagePickerControllerSourceType)sourceType{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.sourceType = sourceType;
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    //推出ImagePickercontroller
    [self presentViewController:imagePicker animated:YES completion:nil];
}
#pragma mark- UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    self.imageView.image = info[UIImagePickerControllerEditedImage];
    //返回推出的控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

//点击空白处返回
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
@end
