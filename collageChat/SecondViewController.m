//
//  SecondViewController.m
//  collageChat
//
//  Created by Ryan Chan on 7/26/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomTableViewCell.h"
#import "APIData.h"

@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *theArrayOfData;
@property (strong,nonatomic) NSMutableArray *theArrayOfMusicData;
@property (strong, nonatomic) IBOutlet UIImageView *friendProfile;


@end

@implementation SecondViewController
NSMutableData *receivedData;
NSMutableData *receivedMusicData;

BOOL movieDone = NO;
BOOL musicDone = NO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
                                                      
    self.friendProfile.layer.masksToBounds = YES;
    self.friendProfile.layer.cornerRadius = 60;
    self.theArrayOfData = [[NSMutableArray alloc] init];
    self.theArrayOfMusicData = [[NSMutableArray alloc] init];
    
    receivedMusicData = [[NSMutableData alloc] init];
    
    receivedData = [[NSMutableData alloc] init];
    
    [self getMovieData];
    [self getMusicData];
    
    [self.tableView setDelegate:self];
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







- (void) getMovieData {
    
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?limit=2&country=us&apikey=cvmarx69ap8246zxr5cp5mcr"]];
    // Specify that it will be a POST request
    
    
    request.HTTPMethod = @"GET";
    
    
    self.firstConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    
    if(self.firstConnection)
    {
        NSLog(@"Connection succesful");
        
        
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Not Connected"
                              message: @"You currently not connected to the internet"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    
    
    
}



-(void) getMusicData {
    
    
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://partner.api.beatsmusic.com/v1/api/genres?limit=2&offset=0&client_id=zycutnpx8kvgp86ghxt7nrtt"]];

    
    
    request.HTTPMethod = @"GET";
    
    
    self.musicConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    
    if(self.musicConnection)
    {
        NSLog(@"Connection succesful");
        
        
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Not Connected"
                              message: @"You currently not connected to the internet"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    

    
    
    
   
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    if(connection == self.firstConnection){
    
    [receivedData appendData:data];
    
    // NSString * strData1= [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    
    NSError *error = nil;
    
    if (error) {
        
        NSLog(@"There was an error in the data");
    }
    }
    
    
    
    
    
    
    if (connection == self.musicConnection){
        
        [receivedMusicData appendData:data];
        
        // NSString * strData1= [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        
        
        NSError *error = nil;
        
        if (error) {
            
            NSLog(@"There was an error in the data");
        }

        
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error: %@, %@", [error localizedDescription], [error localizedFailureReason]);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if(connection ==self.firstConnection) {
        
        id json = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil];
        
        
        NSArray *movies = [json objectForKey:@"movies"];
        
        
        NSLog(@"%ld",movies.count);
        
        for (int i= 0; i< movies.count; i++) {
            
            // NSLog(@"\n %@ \n",[[json objectForKey:@"movies"][i] objectForKey:@"synopsis"]);
            
            NSString *synopsis = [NSString stringWithFormat: @"%@ \n",[[json objectForKey:@"movies"][i] objectForKey:@"synopsis"]];
            
            NSString *title = [NSString stringWithFormat: @"%@ \n",[[json objectForKey:@"movies"][i] objectForKey:@"title"]];
            
            
            
            
            NSString *stringForImage = [[[json objectForKey:@"movies"][i] objectForKey:@"posters"] objectForKey:@"thumbnail"];
                                  
                                  
            NSURL *urlForImage = [NSURL URLWithString:stringForImage];
            
            NSError* error = nil;
            NSData* data = [NSData dataWithContentsOfURL:urlForImage options:NSDataReadingUncached error:&error];
            
            if (error) {
                NSLog(@"%@", [error localizedDescription]);
            } else {
                NSLog(@"Data has loaded successfully.");
            }

            
            UIImage *image = [UIImage imageWithData: data];
            
        
                
            APIData *theData = [[APIData alloc] init];
            theData.thumbnailImage = image;
            theData.label =title;
            theData.heartedBOOL = NO;
            
            [self.theArrayOfData addObject:theData];
            
            


        }
        
        movieDone = YES;
        [self.tableView reloadData];
        
    }
    
    
    
    
    
    
    if(connection ==self.musicConnection) {
        
        id json = [NSJSONSerialization JSONObjectWithData:receivedMusicData options:0 error:nil];
        
        NSLog(@"%@",json);

        
        NSString *detail1 =
        [[json objectForKey:@"data"][0] objectForKey:@"name"];
        
        NSString *detail2 =
        [[json objectForKey:@"data"][1] objectForKey:@"name"];
        
        NSLog(@"%@ AND %@", detail1, detail2);
        
        
        
        
        NSString *stringForImage1 = [NSString stringWithFormat:@"https://partner.api.beatsmusic.com/v1/api/genres/%@/images/default?client_id=zycutnpx8kvgp86ghxt7nrtt",[[json objectForKey:@"data"][0] objectForKey:@"id"] ];
        
        
        NSURL *urlForImage1 = [NSURL URLWithString:stringForImage1];
        
        NSError* error = nil;
        NSData* data = [NSData dataWithContentsOfURL:urlForImage1 options:NSDataReadingUncached error:&error];
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            NSLog(@"Data has loaded successfully.");
        }
        
        
        UIImage *image1 = [UIImage imageWithData: data];
        
        
        
        

        
        
        
        NSString *stringForImage2 = [NSString stringWithFormat:@"https://partner.api.beatsmusic.com/v1/api/genres/%@/images/default?client_id=zycutnpx8kvgp86ghxt7nrtt",[[json objectForKey:@"data"][1] objectForKey:@"id"] ];
        
        
        
        NSURL *urlForImage2 = [NSURL URLWithString:stringForImage2];
        
        error = nil;
        NSData* data2 = [NSData dataWithContentsOfURL:urlForImage2 options:NSDataReadingUncached error:&error];
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            NSLog(@"Data has loaded successfully.");
        }
        
        
        UIImage *image2 = [UIImage imageWithData: data2];
        
        
        
        
        
        
        
        
        APIData *musicData = [[APIData alloc] init];
        musicData.label = detail1;
        musicData.thumbnailImage = image1;
        
        [self.theArrayOfMusicData addObject:musicData];
        
        
        APIData *musicData2 = [[APIData alloc] init];
        musicData2.label = detail2;
        musicData2.thumbnailImage = image2;
        
        [self.theArrayOfMusicData addObject:musicData2];
        
        
        musicDone = YES;
        [self.tableView reloadData];
        
    }
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"Cell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    

    
    
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    if(indexPath.section == 0 && movieDone) {
        
        APIData *theCellsData = self.theArrayOfData[indexPath.row];
        
        
        
        cell.imageView.image =theCellsData.thumbnailImage;
        cell.titleLabel.text = theCellsData.label;
        
    }
    
    if(indexPath.section ==1 && musicDone ) {
        
        APIData *theCellsData = self.theArrayOfMusicData[indexPath.row];
        
        cell.imageView.image = theCellsData.thumbnailImage;
        cell.titleLabel.text = theCellsData.label;
        
    }
    
    
    if(indexPath.section == 2 && movieDone) {
        
        NSArray *imageArray = @[[UIImage imageNamed:@"apple.png"],[UIImage imageNamed:@"orange.png"]];
                                
        NSArray *theArray = @[@"Apples",@"Oranges"];
        
        
        cell.imageView.image =imageArray[indexPath.row];
        cell.titleLabel.text = theArray[indexPath.row];
        
    }
    
    
    
    
    
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName =@"My Favorite Movies";
            break;
        case 1:
            sectionName = @"Songs I like";
            break;
        case 2:
            sectionName = @"Other things I enjoy";
            break;

        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
