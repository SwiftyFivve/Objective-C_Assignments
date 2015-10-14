//
//  SecondViewController.m
//  webAssignment
//
//  Created by Jordan Weaver on 9/22/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "SecondViewController.h"
#import "TableViewCell.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize myTableView, dummyWebView, apiData, titles, authors, urls, sourceWebView, sendURL;

static NSString* cellReuse = @"cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL* url = [NSURL URLWithString:@"http://api.reddit.com/r/nfl"];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [dummyWebView loadRequest:request];
    
    apiData = [[NSMutableData alloc]init];
    NSURLConnection* connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [connection start];
    
    titles = [NSMutableArray arrayWithObjects:nil, nil];
    authors = [NSMutableArray arrayWithObjects:nil, nil];
    urls = [NSMutableArray arrayWithObjects:nil, nil];
    
    //sourceWebView = [[ThirdViewController alloc]init];
    
    [myTableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:cellReuse];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil)
    {
        [apiData appendData:data];
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if ([apiData length] != 0)
    {
        NSMutableDictionary* response = (NSMutableDictionary*)[NSJSONSerialization JSONObjectWithData:apiData options:NSJSONReadingMutableContainers error:nil];
        
        BOOL isDictionary = [response isKindOfClass:[NSMutableDictionary class]];
        
        if (isDictionary)
        {
            NSMutableDictionary* dataDic = [response objectForKey:@"data"];
            NSMutableArray* children = [dataDic objectForKey:@"children"];
            
            for (int i = 0; i < [children count]; i++) {
                NSMutableDictionary* child = [children objectAtIndex:i];
                NSMutableDictionary* articleData = [child objectForKey:@"data"];
                //NSLog(@"%@", [articleData objectForKey:@"title"]);
                [titles addObject:[articleData objectForKey:@"title"]];
                [authors addObject:[articleData objectForKey:@"author"]];
                [urls addObject:[articleData objectForKey:@"url"]];
                
            }
            [myTableView reloadData];
        }
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titles count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 107.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell* newCell = [tableView dequeueReusableCellWithIdentifier:cellReuse];
    
    newCell.articleTitle.text = [titles objectAtIndex:indexPath.row];
    
    newCell.author.text = [authors objectAtIndex:indexPath.row];
    
    return newCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //sourceWebView = [[ThirdViewController alloc]init];
    sendURL = [urls objectAtIndex:indexPath.row];
    NSLog(@"click worked");
    [self performSegueWithIdentifier:@"thirdSegue" sender:self];
    //[self presentViewController:sourceWebView animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((ThirdViewController*)segue.destinationViewController).webView = sendURL;
}

-(IBAction)exit:(UIStoryboardSegue*)segue
{
    sendURL = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
