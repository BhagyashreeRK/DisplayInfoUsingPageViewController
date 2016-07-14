//
//  ViewController.h
//  DisplayInfoUsingPageViewController
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property UIPageViewController *pageViewController;
@property (nonatomic,strong)NSArray* titleArray;
@property (nonatomic,strong)NSArray* imageArray;
@property (weak, nonatomic) IBOutlet UIButton *startAgainButton;

@end

