//
//  ViewController.m
//  addressBookAssignment
//
//  Created by Jordan Weaver on 9/24/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ViewController.h"
#import "customCell.h"
#import "customObject.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mainEmail, myTableView, time, objectInfo, mainInfo;
static NSString* cellReuse = @"cell";
static int emailCount = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    mainInfo = [[NSMutableArray alloc]init];
    
    [myTableView registerNib:[UINib nibWithNibName:@"customCell" bundle:nil] forCellReuseIdentifier:cellReuse];
}

#pragma mark -------------
#pragma mark People Picker
#pragma mark -------------

-(IBAction)showPeoplePicker:(id)sender
{
    ABPeoplePickerNavigationController* peoplePicker = [[ABPeoplePickerNavigationController alloc]init];
    
    peoplePicker.peoplePickerDelegate = self;
    
    [self presentViewController:peoplePicker animated:YES completion:nil];
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    return YES;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    if (property == kABPersonEmailProperty)
    {
        ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
        
        mainEmail = nil;
        if (ABMultiValueGetCount(emails) > 0)
        {
            mainEmail = (__bridge_transfer NSString*)ABMultiValueCopyValueAtIndex(emails, 0);
        }
        
        if (mainEmail != nil)
        {
            MFMailComposeViewController* mailView;
            
            mailView = [[MFMailComposeViewController alloc]init];
            
            mailView.mailComposeDelegate = self;
            
            [mailView setToRecipients:[NSArray arrayWithObject:mainEmail]];
            [peoplePicker presentViewController:mailView animated:YES completion:nil];
        }
    }
    
    return NO;
}



#pragma mark -------------
#pragma mark NewPerson
#pragma mark -------------

-(IBAction)showNewPerson:(id)sender
{
    ABNewPersonViewController* newPerson = [[ABNewPersonViewController alloc]init];
    
    newPerson.newPersonViewDelegate = self;
    
    [self.navigationController pushViewController:newPerson animated:YES];
}

-(void)newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(ABRecordRef)person
{
    if (person != nil)
    {
        NSLog(@"Person saved");
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -------------
#pragma mark Email control
#pragma mark -------------

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (result == MFMailComposeResultSent) {
        emailCount ++;
        NSDate* clickTime = [NSDate date];
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
        if (dateFormatter !=nil)
        {
            [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
            time = [dateFormatter stringFromDate: clickTime];
        }
        
        NSLog(@"%@", mainEmail);
        
        [mainInfo addObject:[[customObject alloc]initWithEmail:mainEmail andTime:time]];
        
        [myTableView reloadData];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return emailCount;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    customCell* newCell = [tableView dequeueReusableCellWithIdentifier:cellReuse];
    customObject* currentAddress = [mainInfo objectAtIndex:indexPath.row];
    newCell.emailLabel.text = [NSString stringWithFormat:@"Email Sent To: %@", currentAddress.sentStr];
    newCell.timeLabel.text = [NSString stringWithFormat:@"Sent at %@", currentAddress.timeSent];
    
    return newCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
