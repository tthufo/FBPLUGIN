//
//  SecondViewController.m
//  FBPLUGIN
//
//  Created by thanhhaitran on 1/13/16.
//  Copyright © 2016 thanhhaitran. All rights reserved.
//

#import "SecondViewController.h"

#import "DropButton.h"

@interface SecondViewController ()
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
        cell = [[NSBundle mainBundle] loadNibNamed:@"Cells" owner:self options:nil][0];
    }
  
    DropButton * drop = (DropButton*)[self withView:self.view tag:1];
    
    drop.pList = @"format";
    
    [drop addTarget:self action:@selector(didPressButtonAt:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
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
