//
//  LandlordViewController.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "LandlordViewController.h"
#import "Landlord.h"
#import "Unit.h"
#import "UnitTableViewCell.h"

@interface LandlordViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *landlordTableView;
@property (nonatomic, strong) NSArray *propertyArray;
@property (weak, nonatomic) IBOutlet UILabel *landlordNameLabel;

@end

@implementation LandlordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialSetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialSetup
{
    Landlord *landlord1 = [[Landlord alloc] initWithname:@"Bill"];
    
    Unit *unit100 = [[Unit alloc] initWithUnitNumber:100 isVacant:NO];
    
    self.propertyArray = @[unit100];
    self.landlordNameLabel.text = [NSString stringWithFormat:@"%@", landlord1];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.propertyArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UnitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UnitCell"];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
