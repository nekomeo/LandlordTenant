//
//  TenantComplaintDetailViewController.m
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "TenantComplaintDetailViewController.h"

@interface TenantComplaintDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIImageView *complaintTypeImage;
@property (weak, nonatomic) IBOutlet UITextView *complaintDetails;

@end

@implementation TenantComplaintDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.complaintType == general){
        self.testLabel.text = @"General";
    }else if (self.complaintType == maintenance){
        self.testLabel.text = @"Maintenance";
        self.complaintTypeImage.image = [UIImage imageNamed:@"Wrench-large.jpg"];
    }else if(self.complaintType == noise){
        self.testLabel.text = @"Noise";
    }
}


- (IBAction)addComplaintButton:(id)sender {
    
    NSDate *date = [NSDate date];
    
    TenantComplaint *complaint = [[TenantComplaint alloc] initWithType:self.complaintType date:date description:self.complaintDetails.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end