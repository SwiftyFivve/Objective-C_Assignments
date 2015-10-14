//
//  ViewController.m
//  tableViewAssignment_weaverJordan
//
//  Created by Jordan Weaver on 9/3/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "ViewController.h"
#import "artistInfo.h"
#import "detailsPageViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize artistArry, VCTableView;

- (void)viewDidLoad
{
    
    artistInfo* titleFightInfo = [[artistInfo alloc] init];
    artistInfo* joyceManorInfo = [[artistInfo alloc]init];
    artistInfo* codeOrangeInfo = [[artistInfo alloc]init];
    artistInfo* savesTheDayInfo = [[artistInfo alloc]init];
    artistInfo* snowingInfo = [[artistInfo alloc]init];
    
    //titleFight
    titleFightInfo.name =@"Title Fight";
    titleFightInfo.releaseDate = @"11/25/12";
    titleFightInfo.albumArt = [UIImage imageNamed:@"shed.png"];
    titleFightInfo.trackList = @" 1. Coxton Yard\n 2. Shed\n 3. Flood of'72\n 4. Society\n 5. You Can't Say Kingston Doesn't\n     Love You\n 6. Crescent-Shaped Depression\n 7. Safe In Your Skin\n 8. Where Am I?\n 9. Your Screen Door\n 10. 27\n 11. Stab\n 12. GMT (Greenwich Mean Time)";
    
    //joyceManor
    joyceManorInfo.name = @"Joyce Manor";
    joyceManorInfo.releaseDate = @"8/28/14";
    joyceManorInfo.albumArt = [UIImage imageNamed:@"joyce.png"];
    joyceManorInfo.trackList = @" 1. Orange Julius\n 2. Call Out\n 3. Beach Community\n 4. Derailed\n 5. Famous Friend\n 6. Leather Jacket\n 7. 21st Dead Rats\n 8. Constant Nothing\n 9. Ashtray Petting Zoo\n 10. Constant Headache";
    
    //codeOrange
    codeOrangeInfo.name = @"Code Orange Kids";
    codeOrangeInfo.releaseDate = @"9/8/14";
    codeOrangeInfo.albumArt = [UIImage imageNamed:@"cok.png"];
    codeOrangeInfo.trackList = @" 1. I Am King\n 2. Slowburn\n 3. Dreams in Inertia\n 4. Unclean Spirit\n 5. Alone in a Room\n 6. My World\n 7. Starve\n 8. Your Body is Ready....\n 9. Thinners of the Herd\n 10. Bind You\n 11. Mercy";
    //savesTheDay
    savesTheDayInfo.name = @"Saves The Day";
    savesTheDayInfo.releaseDate = @"10/27/13";
    savesTheDayInfo.albumArt = [UIImage imageNamed:@"std.png"];
    savesTheDayInfo.trackList = @" 1. All-Star Me\n 2. You Vandal\n 3. Shoulder to the Wheel\n 4. Rocks Tonic Juice Magic\n 5. Holly Hox, Forget Me Nots\n 6. Third Engine\n 7. My Sweet Fracture\n 8. The Vast Spoils of America\n 9. The Last Lie I Told\n 10. Do You Know What I Love the\n       Most?\n 11. Through Being Cool\n 12. Banned from the Back Porch";
    
    //snowing
    snowingInfo.name = @"Snowing";
    snowingInfo.releaseDate = @"4/25/2000";
    snowingInfo.albumArt = [UIImage imageNamed:@"snowing.png"];
    snowingInfo.trackList = @" 1. I Think We're In Minsk\n 2. Mark Z. Danielewski\n 3. Malk It\n 4. Why Am I Not Going\n     Underwater?\n 5. You Bring Something... No\n 6. So I Shotgunned A Beer And\n     Went To Bed\n 7. It's Just A Party\n 8. Memo Yeah That's Fine Man\n 9. KJ Jammin\n 10. Damp Feathers\n 11. Could Be Better Forever";
    
    artistArry = [NSArray arrayWithObjects:titleFightInfo, joyceManorInfo, codeOrangeInfo, savesTheDayInfo, snowingInfo, nil];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"cells";
    UITableViewCell* newCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (newCell == nil)
    {
        newCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //never set text in this if check.
        newCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    
    artistInfo* artistDetails = (artistInfo*)artistArry[indexPath.row];
    
    newCell.textLabel.text = artistDetails.name;
    
    return newCell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    detailsPageViewController* someName = segue.destinationViewController;
    [VCTableView indexPathForSelectedRow];
    someName.artistDets = (artistInfo*)artistArry[[VCTableView indexPathForSelectedRow].row];
    
    
}

-(IBAction)exit:(UIStoryboardSegue*)segue
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
