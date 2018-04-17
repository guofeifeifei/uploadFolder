//
//  ViewController.m
//  test
//
//  Created by 飞鱼2100 on 2018/4/16.
//  Copyright © 2018年 feiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UILabel *alertAlert;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fileNotification:) name:@"FileNotification" object:nil];
    
}
- (void)fileNotification:(NSNotification *)notifcation {
    NSDictionary *info = notifcation.userInfo;
    // fileName是文件名称、filePath是文件存储在本地的路径
    // jfkdfj123a.pdf
    NSString *fileName = [info objectForKey:@"fileName"];
    // /private/var/mobile/Containers/Data/Application/83643509-E90E-40A6-92EA-47A44B40CBBF/Documents/Inbox/jfkdfj123a.pdf
    NSString *filePath = [info objectForKey:@"filePath"];
    
    NSLog(@"fileName=%@---filePath=%@", fileName, filePath);
    self.alertAlert.text = [NSString stringWithFormat:@"正在上传文件，文件地址%@", filePath ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
