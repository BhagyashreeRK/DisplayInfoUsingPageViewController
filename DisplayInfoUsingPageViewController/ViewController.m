//
//  ViewController.m
//  DisplayInfoUsingPageViewController
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"

@interface ViewController ()<UIPageViewControllerDataSource>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray=@[@"Rose",@"Sunflower",@"Jasmin",@"Tulip"];
    _imageArray=@[@"rose",@"sunflower",@"jasmin",@"tulip"];
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController =[self viewControllerAtIndex:0];
    NSArray* viewControllers =@[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*)viewController).pageindex;
    if((index==0)||(index==NSNotFound))
    {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*)viewController).pageindex;
    if(index==NSNotFound)
    {
        return nil;
    }
    index++;
    if(index==[_titleArray count])
    {
        return nil;
    }

    return [self viewControllerAtIndex:index];
}

-(PageContentViewController*)viewControllerAtIndex:(NSUInteger)index
{
    if(([_titleArray count]==0)||index>=[self.titleArray count])
    {
        return nil;
    }
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.pageimg=_imageArray[index];
    pageContentViewController.pagetitle=_titleArray[index];
    pageContentViewController.pageindex=index;
    return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.titleArray count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


- (IBAction)startAgainAction:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil]; 
    
}

@end
