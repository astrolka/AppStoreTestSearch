//
//  ViewController.m
//  AppStoreSearchTest
//
//  Created by Александр Смоленский on 05.04.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

#import "VASSearchResultsViewController.h"
#import "VASSearchResultsControllerViewModel.h"
#import "VASAppSearchResultViewModel.h"
#import "VASSearchResultCell.h"
#import "VASDynamicProperty.h"

@interface VASSearchResultsViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property(strong, nonatomic)VASSearchResultsControllerViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation VASSearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 60;
}

- (void)bindViewModel:(id)viewModel {
    _viewModel = viewModel;
    
    __weak typeof(self) weakSelf = self;
    [self.viewModel.cellsViewModels
    bindListener:^(id viewModels) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            [strongSelf.tableView reloadData];
        });
    }];
    [self.viewModel.isExecuting
    bindListener:^(NSNumber *value) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:value.boolValue];
        });
    }];
}
- (IBAction)searchButtonAction:(UIButton *)sender {
    if (self.searchTextField.isFirstResponder) {
        [self.searchTextField resignFirstResponder];
    }
    [self.viewModel performSearchWithText:self.searchTextField.text];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VASAppSearchResultViewModel *cellVM = [self.viewModel viewModelForIndexPath:indexPath];
    VASSearchResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VASSearchResultCell"];
    [cell bindViewModel:cellVM];
    return cell;
}

#pragma mark - <UITextFieldDelegate>

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self searchButtonAction:nil];
    return YES;
}

@end
