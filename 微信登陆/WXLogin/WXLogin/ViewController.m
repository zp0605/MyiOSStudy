//
//  ViewController.m
//  WXLogin
//
//  Created by Lucifer on 2018/10/18.
//  Copyright © 2018 Lucifer. All rights reserved.
//

#import "ViewController.h"
#import <WXApi.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)Wechat:(id)sender {
    
    SendAuthReq *req = [[SendAuthReq alloc] init];
    req.openID = @"wx5e109839aaaa96bc";
    req.state = @"state";
    req.scope = @"snsapi_userinfo";
    
    [WXApi sendReq:req];
}


@end
