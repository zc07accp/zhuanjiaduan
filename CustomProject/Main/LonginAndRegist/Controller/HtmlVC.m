//
//  HtmlVC.m
//  CustomProject
//
//  Created by mozhu on 2017/11/7.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "HtmlVC.h"
@interface HtmlVC ()

@end

@implementation HtmlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle=self.titleStr;
    
    UIWebView *webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
    [self.view addSubview:webView];

    
    if (self.url.length)
    {
        
//        [webView loadHTMLString:self.url baseURL:nil];

        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    }else if(self.H5Code.length)
    {

                [webView loadHTMLString:self.H5Code baseURL:nil];
    }
    else
    {
        if ([self.titleStr isEqualToString:@"免责申明"])
        {

        }else
        {
        }

    }
    
   
}


@end
