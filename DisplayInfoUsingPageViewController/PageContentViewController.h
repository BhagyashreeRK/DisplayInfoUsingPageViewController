//
//  PageContentViewController.h
//  DisplayInfoUsingPageViewController
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property NSUInteger pageindex;
@property NSString* pagetitle;
@property NSString* pageimg;


@end
