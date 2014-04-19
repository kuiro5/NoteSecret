//
//  jjkTableViewController.m
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/4/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import "jjkTableViewController.h"
#import "jjkNotepadViewController.h"
#import "jjkExistingNotepadViewController.h"

@interface jjkTableViewController ()

@property(strong,nonatomic) NSIndexPath *pathToPass;
@end


@implementation jjkTableViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        _model = [Model sharedInstance];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
            self.pathToPass = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    


}

-(void)viewWillAppear:(BOOL)animated
{
    self.pathToPass = nil;
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.pathToPass = indexPath;
    
    NSLog(@"SELECTED THIS: %d", self.pathToPass.row);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.model.noteSecretArray count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSLog(@"***Getting Called");
    
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
     cell.textLabel.text = [[self.model.noteSecretArray objectAtIndex:indexPath.row] objectForKey:@"NoteLabel"];
    
    //cell.textLabel.text = [self.model nameAtIndex:indexPath.row];
    //cell.detailTextLabel.text = [self.model addressAtIndex:indexPath.row];
    
    
    return cell;
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddNoteSegue"])
    {
    jjkNotepadViewController *notepadViewController = segue.destinationViewController;
    notepadViewController.completionBlock = ^(id obj) {
        [self dismissViewControllerAnimated:YES completion:NULL];
        if (obj) {
            //NSDictionary *dictionary = obj;
            //[self.myDataManager addBuilding:dictionary];
        }
    };
    }
    else if ([segue.identifier isEqualToString:@"OldNoteSegue"])
    {
        jjkExistingNotepadViewController *existingNotepadViewController = segue.destinationViewController;
        
        //NSDictionary *dictionaryToPass = [self.model.noteSecretArray objectAtIndex:rowSelected];
        //existingNotepadViewController.contentToPass = [dictionaryToPass objectForKey:@"NoteContent"];
        //existingNotepadViewController.titleToPass = [dictionaryToPass objectForKey:@"NoteLabel"];
        
        
        existingNotepadViewController.pathToLoad = [self.tableView indexPathForSelectedRow];
        
        NSLog(@"SEGUE %d", existingNotepadViewController.pathToLoad.row);
        
        existingNotepadViewController.completionBlock = ^(id obj) {
            [self dismissViewControllerAnimated:YES completion:NULL];
            if (obj) {
                //NSDictionary *dictionary = obj;
                //[self.myDataManager addBuilding:dictionary];
            }
        };
        
    }

}


@end
