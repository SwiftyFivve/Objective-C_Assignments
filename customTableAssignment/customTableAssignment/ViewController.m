//
//  ViewController.m
//  customTableAssignment
//
//  Created by Jordan Weaver on 9/5/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ViewController.h"
#import "customCell.h"
#import "customHeader.h"
#import "customClass.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTableView, mustDos, toDos, actionSheet, buttonNum, tagNum;

static NSString* cellReuse = @"cell";
static NSString* headerReuse = @"header";

int mustCount = 5;
int doCount = 5;


- (void)viewDidLoad
{
    customClass* cleanHouse = [[customClass alloc]init];
    customClass* rockNroll = [[customClass alloc]init];
    customClass* partyErr = [[customClass alloc]init];
    customClass* beerPickUp = [[customClass alloc]init];
    customClass* dumpGf = [[customClass alloc]init];
    customClass* fish = [[customClass alloc]init];
    customClass* moreBeer = [[customClass alloc]init];
    customClass* kidRock = [[customClass alloc]init];
    customClass* shower = [[customClass alloc]init];
    customClass* feedKid = [[customClass alloc]init];
    customClass* teeth = [[customClass alloc]init];
    customClass* rent = [[customClass alloc]init];
    customClass* exex = [[customClass alloc]init];
    
    
    cleanHouse.event = @"Clean House";
    cleanHouse.importance = @"!";
    cleanHouse.img = [UIImage imageNamed:@"boring.jpg"];
    
    rockNroll.event = @"RockNRoll All Night";
    rockNroll.importance = @"!!!!!";
    rockNroll.img = [UIImage imageNamed:@"kiss.jpg"];
    
    partyErr.event = @"Party Everyday";
    partyErr.importance = @"!!!!!!";
    partyErr.img = [UIImage imageNamed:@"kiss.jpg"];
    
    beerPickUp.event = @"Pick up Beer";
    beerPickUp.importance =@"!!!!!";
    beerPickUp.img = [UIImage imageNamed:@"kiss.jpg"];
    
    dumpGf.event = @"Dump girlfriend";
    dumpGf.importance = @"!!!";
    dumpGf.img = [UIImage imageNamed:@"kiss.jpg"];
    
    fish.event = @"Go Fishing";
    fish.importance = @"!!!";
    fish.img = [UIImage imageNamed:@"kiss.jpg"];
    
    moreBeer.event =@"Pick up More Beer";
    moreBeer.importance = @"!!!!!";
    moreBeer.img = [UIImage imageNamed:@"kiss.jpg"];
    
    kidRock.event = @"Listen to Kid Rock";
    kidRock.importance = @"!!!!!!!!!!!";
    kidRock.img = [UIImage imageNamed:@"kiss.jpg"];
    
    shower.event = @"Shower";
    shower.importance = @"!";
    shower.img = [UIImage imageNamed:@"boring.jpg"];
    
    feedKid.event = @"Feed Kid";
    feedKid.importance = @"...!";
    feedKid.img = [UIImage imageNamed:@"boring.jpg"];
    
    teeth.event = @"Brush Teeth";
    teeth.importance = @"!!";
    teeth.img = [UIImage imageNamed:@"boring.jpg"];
    
    rent.event = @"Pay Rent";
    rent.importance = @"!!!";
    rent.img = [UIImage imageNamed:@"boring.jpg"];
    
    exex.event = @"Call ExEx Girlfriend";
    exex.importance = @"!!!";
    exex.img = [UIImage imageNamed:@"kiss.jpg"];
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    mustDos = [NSArray arrayWithObjects: cleanHouse, rockNroll, partyErr, beerPickUp, dumpGf, fish, moreBeer, kidRock, nil];
    
    toDos = [NSArray arrayWithObjects: shower, feedKid, teeth, rent, exex, fish, moreBeer, kidRock, nil];
    
    
    kiss = [UIImage imageNamed: @"kiss.jpg"];
    boring = [UIImage imageNamed:@"boring.jpg"];
    
    [myTableView registerNib:[UINib nibWithNibName:@"customHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:headerReuse];
    
    [myTableView registerNib:[UINib nibWithNibName:@"customCell" bundle:nil] forCellReuseIdentifier:cellReuse];
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Would you like to Delete the last one" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"DELETE" otherButtonTitles: nil, nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // code add/delete counter to do/must count
    
    switch (section) {
        case 0:
            return mustCount;
            break;
            
        case 1:
            return doCount;
            break;
            
        default:
            break;
    }
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    customHeader* newHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerReuse];
    
    switch (section) {
        case 0: {
            UIView * newView = [[UIView alloc]initWithFrame:newHeader.backgroundView.frame];
            newView.backgroundColor = [UIColor whiteColor];
            newHeader.backgroundView = newView;
            newHeader.headerLabel.text = [NSString stringWithFormat:@"Must Do"];
            newHeader.delButton.tag = 0;
            newHeader.addButton.tag = 0;
        }
            break;
        case 1: {
            UIView * newView = [[UIView alloc]initWithFrame:newHeader.backgroundView.frame];
            newView.backgroundColor = [UIColor whiteColor];
            newHeader.backgroundView = newView;
            newHeader.headerLabel.text = [NSString stringWithFormat:@"To Do"];
            newHeader.delButton.tag = 1;
            newHeader.addButton.tag = 1;
        }
            break;
            
        default:
            break;
    }
    
    
    
    return newHeader;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100.0f;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 126.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    customCell* newCell = [tableView dequeueReusableCellWithIdentifier:cellReuse];
    
    if (indexPath.section == 1)
    {
        newCell.backgroundView = [[UIImageView alloc]initWithImage:[(customClass*)[toDos objectAtIndex:indexPath.row]img]];
        newCell.cellLabel.text = [(customClass*)[toDos objectAtIndex: indexPath.row]event];
        newCell.importLabel.text = [(customClass*)[toDos objectAtIndex: indexPath.row]importance];
    }else
    {
        newCell.backgroundView = [[UIImageView alloc]initWithImage:[(customClass*)[mustDos objectAtIndex:indexPath.row]img]];
        newCell.cellLabel.text = [(customClass*)[mustDos objectAtIndex:indexPath.row]event];
        newCell.importLabel.text = [(customClass*)[mustDos objectAtIndex: indexPath.row]importance];
    }
    
    
    return newCell;
}

-(IBAction)del:(id)sender
{
    [actionSheet showInView:self.view];
    
   tagNum = ((UIButton*)sender).tag;
    
//    if (tagNum == 0)
//        mustCount --;
//    else
//        doCount --;
    
    
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        switch (tagNum) {
            case 0:
                mustCount --;
                break;
            case 1:
                doCount --;
                break;
                
            default:
                break;
        }
    }
    else
    {
       
    }
    
    [myTableView reloadData];
}

-(IBAction)add:(id)sender
{
    tagNum = ((UIButton*)sender).tag;
    
    if (tagNum == 0)
        mustCount ++;
    else
        doCount ++;
    
    [myTableView reloadData];
    
}

@end
