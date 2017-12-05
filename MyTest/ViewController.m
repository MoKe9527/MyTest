//
//  ViewController.m
//  MyTest
//
//  Created by wang on 15/7/23.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"


@interface ViewController ()
{
    BMKMapView *bikeMapView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *docuPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"FaceImage"];
    
    NSDictionary* defaults = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    
//    TestViewController *testView=[[TestViewController alloc]init];
//    testView.view.backgroundColor=[UIColor greenColor];
//    testView.view.frame=CGRectMake(100, 200, 100, 200);
//    [self.view addSubview:testView.view];
    int i=1<<4;
    NSLog(@"%zi",i);
    
    bikeMapView = [[BMKMapView alloc]init];
    bikeMapView.zoomLevel = 15;
    bikeMapView.showMapScaleBar = NO;
    bikeMapView.showsUserLocation = YES;
    bikeMapView.isSelectedAnnotationViewFront = YES;
    [bikeMapView setCenterCoordinate:CLLocationCoordinate2DMake(30.63025352, 104.07471307) animated:YES];
    bikeMapView.userTrackingMode = BMKUserTrackingModeNone;
    [self.view addSubview:bikeMapView];
    [bikeMapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
        make.bottom.equalTo(self.view).offset(30);
    }];
    
    BMKLocationViewDisplayParam *displayParam = [[BMKLocationViewDisplayParam alloc]init];
    displayParam.isRotateAngleValid = true;//跟随态旋转角度是否生效
    displayParam.isAccuracyCircleShow = YES;//精度圈是否显示
    displayParam.locationViewOffsetX = 0;//定位偏移量(经度)
    displayParam.locationViewOffsetY = 0;//定位偏移量（纬度）
    displayParam.locationViewImgName = @"icon_center_point";
    [bikeMapView updateLocationViewWithParam:displayParam];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    static TestViewController *testView;
    if (testView.view.superview) {
        [testView.view removeFromSuperview];
    }else{
        testView=[[TestViewController alloc]init];
        testView.view.backgroundColor=[UIColor greenColor];
        testView.view.frame=self.view.frame;
        [self.view addSubview:testView.view];
    }
    
}
@end
