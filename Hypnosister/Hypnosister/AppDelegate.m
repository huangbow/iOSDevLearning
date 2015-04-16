//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Alex on 4/11/15.
//  Copyright (c) 2015 bowen. All rights reserved.
//

#import "AppDelegate.h"
#import "BWHHypnosisView.h"


@interface AppDelegate () <UIScrollViewDelegate>
@property (nonatomic, strong) BWHHypnosisView *hyponosisView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
/*
    CGRect firstframe = CGRectMake(160, 240, 100, 150);

    BWHHypnosisView *firstview = [[BWHHypnosisView alloc] initWithFrame:firstframe];
    firstview.backgroundColor = [UIColor redColor];
    
    [self.window addSubview:firstview];
    
    
    CGRect secondframe = CGRectMake(20, 30, 50, 50);
    
    BWHHypnosisView *secondview = [[BWHHypnosisView alloc] initWithFrame:secondframe];
    secondview.backgroundColor = [UIColor blueColor];
//    [self.window addSubview:secondview];
    [firstview addSubview:secondview];
*/
    
/*
//CH4
    CGRect firstframe = self.window.bounds;
    BWHHypnosisView *firstView = [[BWHHypnosisView alloc] initWithFrame:firstframe];
//    firstView.backgroundColor = [UIColor redColor];
    [self.window addSubview:firstView];
    
*/
    //CH5
    // Create CGRect for frames
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    
    // Create a screen-sized scroll view and add it to the window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    
//    scrollView.pagingEnabled = YES;
    
    
    [self.window addSubview:scrollView];
    
    // Create a super-sized hypnosis view and add it to the scroll view
//    BWHHypnosisView *hyponosisView = [[BWHHypnosisView alloc] initWithFrame:bigRect];
    // Create a screen-sized hypnosis view and add it to the scroll view
    self.hyponosisView = [[BWHHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:self.hyponosisView];
    
    // Add a second screen-sized hypnosis view just off screen to the right
//    screenRect.origin.x += screenRect.size.width;
//    BWHHypnosisView *anotherView = [[BWHHypnosisView alloc] initWithFrame:screenRect];
//    [scrollView addSubview:anotherView];
    
    // Tell the scroll view how big its content area is
    scrollView.contentSize = bigRect.size;
    
    
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
//    UIPinchGestureRecognizer *pinchGest = [[UIPinchGestureRecognizer alloc] initWithTarget:scrollView action:@selector(viewForZoomingInScrollView:)];
    
    scrollView.minimumZoomScale = 1.0;
    scrollView.maximumZoomScale = 3.6;
    
    //MUST HAVE THIS CODE, EVEN IF ALREADY SET UP DELEGATION!!!!!!
    scrollView.delegate = self;
    return YES;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    return self.hyponosisView;
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
