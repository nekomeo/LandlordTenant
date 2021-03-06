//
//  TenantComplaintDetailViewController.m
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "TenantComplaintDetailViewController.h"

@interface TenantComplaintDetailViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIImageView *complaintTypeImage;
@property (weak, nonatomic) IBOutlet UITextView *complaintDetails;

@end

@implementation TenantComplaintDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Based on the button previously pressed in the previous viewcontroller, will display the corresponding image and request type in this view
    
    self.complaintDetails.delegate = self;
    
    if (self.complaintType == general) {
        self.testLabel.text = @"General";
        self.complaintTypeImage.image = [UIImage imageNamed:@"NewGeneral"];
    } else if (self.complaintType == maintenance) {
        self.testLabel.text = @"Maintenance";
        self.complaintTypeImage.image = [UIImage imageNamed:@"NewWrench (1)"];
    } else if (self.complaintType == noise) {
        self.testLabel.text = @"Noise";
        self.complaintTypeImage.image = [UIImage imageNamed:@"NewSound"];
    }
}

- (IBAction)backroundTapped:(id)sender {
    
    [self.complaintDetails resignFirstResponder];
    
}

- (IBAction)addComplaintButton:(id)sender {
    
    NSDate *date = [NSDate date];
    
    TenantComplaintPF *tenantComplaint = [[TenantComplaintPF object] initWithType:self.complaintType date:date description:self.complaintDetails.text];
    
    tenantComplaint.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    
    [tenantComplaint saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
}

- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextViewDelegate methods


- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    if ([self.complaintDetails.text isEqualToString:@"Complaint Details Here"]) {
         self.complaintDetails.text = nil;
    }
}


@end
