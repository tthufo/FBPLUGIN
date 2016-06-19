//
//  SecondViewController.m
//  FBPLUGIN
//
//  Created by thanhhaitran on 1/13/16.
//  Copyright © 2016 thanhhaitran. All rights reserved.
//

#import "SecondViewController.h"

#import "DropButton.h"

@interface SecondViewController () <MHFacebookImageViewerDatasource>
{
    IBOutlet UITableView * tableView;
}

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"data"];
    
    if(!cell)
    {
        cell = [[NSBundle mainBundle] loadNibNamed:@"Cells" owner:self options:nil][1];
    }
  
    ((UIImageView*)[self withView:cell tag:99]).image = [UIImage imageNamed:@"info"];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    
    [button setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    
    UIButton * b = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    
    [b setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    
    [((UIImageView*)[self withView:cell tag:99]) setupImageViewerWithDatasource:self andInfo:@{@"done":button,@"check":NSStringFromCGRect(CGRectMake(100, 100, 50, 50)),@"image":@"menu"} initialIndex:indexPath.row onOpen:^{
        
    } onClose:^{
        
    }];
    
    DropButton * drop = (DropButton*)[self withView:self.view tag:1];
    
    drop.pList = @"format";
    
    [drop addTarget:self action:@selector(didPressButtonAt:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (NSInteger) numberImagesForImageViewer:(MHFacebookImageViewer *)imageViewer {
    return 11;
}

-  (NSURL*) imageURLAtIndex:(NSInteger)index imageViewer:(MHFacebookImageViewer *)imageViewer {
    return [NSURL URLWithString:@"https://pbs.twimg.com/profile_images/638751551457103872/KN-NzuRl.png"];
}

- (UIImage*) imageDefaultAtIndex:(NSInteger)index imageViewer:(MHFacebookImageViewer *)imageViewer{
    return [UIImage imageNamed:@"info"];
}

- (void)didPressButtonAt:(DropButton*)sender
{
    [sender didDropDownWithData:@[@{@"1":@"33",@"ima":@"test"},@{@"1":@"44",@"ima":@"http://exmoorpet.com/wp-content/uploads/2012/08/cat.png"},@{@"1":@"55",@"ima":@"http://exmoorpet.com/wp-content/uploads/2012/08/cat.png"}] andCompletion:^(id object) {
        NSLog(@"%@",object);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
