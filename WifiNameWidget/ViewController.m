//
//  ViewController.m
//  WifiNameWidget
//
//  Created by AidaAkihiro on 2014/10/21.
//  Copyright (c) 2014年 Wasnot Apps. All rights reserved.
//

#import "ViewController.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 3G接続の場合はnilが戻されるので、以降のコードで注意する。
    CFArrayRef interfaces = CNCopySupportedInterfaces();
    
    if(interfaces){
    CFDictionaryRef dicRef = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(interfaces, 0));
    
    if (dicRef) {
        NSString *ssid = CFDictionaryGetValue(dicRef, kCNNetworkInfoKeySSID);
        // Macアドレスを取得
        //macAddress = CFDictionaryGetValue(dicRef, kCNNetworkInfoKeyBSSID);
        NSLog(@"%@", ssid);
        _WifiNameLabel.text = ssid;
    }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
