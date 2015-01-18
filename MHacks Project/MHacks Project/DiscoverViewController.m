//
//  DiscoverViewController.m
//  MHacks Project
//
//  Created by Jamal E. Kharrat on 1/17/15.
//  Copyright (c) 2015 Jamal E. Kharrat. All rights reserved.
//

#import "DiscoverViewController.h"
#import "Organization.h"
#import "User.h"
#import "Constants.h"
#import "ChallengeCell.h"

@interface DiscoverViewController () {
    BOOL organizations ;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation DiscoverViewController


- (IBAction)segmentedControlChangedValue:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        organizations = YES ;
        [self loadObjects];
    }
    else {
        organizations = NO ;
        [self  loadObjects];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    organizations = YES  ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChallengeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ChallengeCellIdentifier];

    // Do any additional setup after loading the view.
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = YES;
        self.objectsPerPage = 8;
    }
    return self;
}


-(PFQuery *)queryForTable {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        organizations = YES ;
    });
    
    if (organizations) {
        PFQuery *query = [Organization query];
        return query ;
    } else {
        PFQuery *users = [User query];
        return users ;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90 ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return  self.objects.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        ChallengeCell *cell  = [tableView dequeueReusableCellWithIdentifier:ChallengeCellIdentifier];
    if (organizations) {
        Organization *organizationAtIdx = self.objects[indexPath.row];
        cell.mainLabel.text = organizationAtIdx.name ;
        cell.logoView.file = organizationAtIdx.logo ;
        cell.detailLabel.hidden = YES ;
        cell.distanceLabel.hidden = YES ;
        cell.limitLabel.hidden = YES ;
    }
    else {
        User *userAtIdx = self.objects[indexPath.row];
        cell.mainLabel.text = userAtIdx.username ;
        cell.detailLabel.text = [NSString stringWithFormat:@"%@ Points",userAtIdx.points];
        cell.distanceLabel.hidden  = YES ;
        cell.limitLabel.hidden = YES ;
    }
    return cell ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
