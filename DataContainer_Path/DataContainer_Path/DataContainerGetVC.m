//
//  DataContainerGetVC.m
//  DataContainer_Path
//
//  Created by TRRogen on 16/5/9.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "DataContainerGetVC.h"

@implementation DataContainerGetVC
-(void)viewDidLoad{
    [super viewDidLoad];
    //get sandBox root cotologe
    NSString *homeRootPath = NSHomeDirectory();
    NSLog(@"根路径%@",homeRootPath);
//    //get sandBox Library path
//    NSString *libraryPath = NSLibraryDirectory();
    /*
    //get document path
     参数1: 指定要搜索的文件枚举值
     参数2: 指定要在哪个domain下面搜索
     参数3: 是否需要全路径,NO表示由~标示数据Container的root directory, YES表示全路径
    */
   NSString *ducumentsPath =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"documents路径%@",ducumentsPath);
    //get library path
    NSString *librayPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
    NSLog(@"library路径%@",librayPath);
    //get temp path
    NSString *tempPath = NSTemporaryDirectory();
    NSLog(@"tems路径%@",tempPath);
    
    NSArray *arr = @[@"Rogen",@26,@[@"jiang",@"li",@"long"]];
    NSString *docuPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *arrPath = [docuPath stringByAppendingPathComponent:@"rogenArr.plist"];
    [arr writeToFile:arrPath atomically:YES];
    
    NSDictionary *dict = @{@"name":@"Rogen",@"age":@26,@"address":@"shengzhen"};
    NSString *dictPath = [docuPath stringByAppendingPathComponent:@"rogenDict.plist"];
    [dict writeToFile:dictPath atomically:YES];
    NSAttributedString
}
@end
