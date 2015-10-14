//
//  customTableView.m
//  searchAssignment
//
//  Created by Jordan Weaver on 9/12/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "customTableView.h"
#import "playerInfo.h"
#import "ViewController.h"

@interface customTableView ()

@end

@implementation customTableView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tableData = [NSMutableArray arrayWithObjects:
                 [[playerInfo alloc]initWithName:@"Joe Flaco" andPosition:positionQuarter],
                 [[playerInfo alloc]initWithName:@"Peyton Manning" andPosition:positionQuarter],
                 [[playerInfo alloc]initWithName:@"Aaron Rodgers" andPosition:positionQuarter],
                 [[playerInfo alloc]initWithName:@"Colin Kaepernick" andPosition:positionQuarter],
                 [[playerInfo alloc]initWithName:@"RGIII" andPosition:positionQuarter],
                 [[playerInfo alloc]initWithName:@"Reggie Bush" andPosition:positionRunning],
                 [[playerInfo alloc]initWithName:@"Frank Gore" andPosition:positionRunning],
                 [[playerInfo alloc]initWithName:@"Adrian Peterson" andPosition:positionRunning],
                 [[playerInfo alloc]initWithName:@"LeSean McCoy" andPosition:positionRunning],
                 [[playerInfo alloc]initWithName:@"Arian Foster" andPosition:positionRunning], nil];
    
    searchResults = [[NSMutableArray alloc]initWithCapacity:[tableData count]];
                 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [tableData count];
    
    if (self.searchDisplayController.searchResultsTableView == tableView)
    {
        count = [searchResults count];
    }
    
    return count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* newCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!newCell) {
        newCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    playerInfo* currentPlayer = [tableData objectAtIndex:indexPath.row];
    
    if (self.searchDisplayController.searchResultsTableView == tableView)
    {
        currentPlayer = [searchResults objectAtIndex:indexPath.row];
    }
    newCell.textLabel.text = currentPlayer.name;
    
    return newCell;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSArray* scopeTitles = [self.searchDisplayController.searchBar scopeButtonTitles];
    NSInteger selected = [self.searchDisplayController.searchBar selectedScopeButtonIndex];
    NSString* currentScope = [scopeTitles objectAtIndex:selected];
    
    [self filterContentForSearch: searchString withScope: currentScope];
    
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    NSArray* scopeTitles = [self.searchDisplayController.searchBar scopeButtonTitles];
    NSString* currentScope = [scopeTitles objectAtIndex:searchOption];
    
    NSString* searchText = [self.searchDisplayController.searchBar text];
    
    [self filterContentForSearch:searchText withScope:currentScope];
    
    return YES;
}

-(void)filterContentForSearch:(NSString*)searchText withScope: (NSString*) theScope
{
    [searchResults removeAllObjects];
    
    NSPredicate* filter = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", searchText];
    
    NSArray* tempResults = [tableData filteredArrayUsingPredicate:filter];
    
    if (![theScope isEqualToString:@"All"]) {
        NSPredicate *scopeFilter =[NSPredicate predicateWithFormat:@"SELF.position contains[c] %@", theScope];
        tempResults = [tempResults filteredArrayUsingPredicate:scopeFilter];
    }
    
    searchResults = [NSMutableArray arrayWithArray:tempResults];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    ViewController* vc = self.navigationController.viewControllers[0];
    vc.savedPlayers = [NSMutableArray arrayWithArray:searchResults];
}


@end
