//
//  documentPresenter.m
//  Formulario 2
//
//  Created by Michal Racko on 11/17/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import "documentPresenter.h"

@implementation documentPresenter

@synthesize cellTable;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
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
    return [cellTable count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentity = [NSString stringWithFormat:@"F%@Cell",(NSString *)[(CellData *)[cellTable objectAtIndex:[indexPath row]] FieldType]];
    NSNumber *flags = [(CellData *)[cellTable objectAtIndex:[indexPath row]] FieldFlags];
    
    if ([cellIdentity isEqualToString:@"FTextCell"]) { // textove pole
        static NSString *cellIdentifier = @"FTextCell";
        
        FTextCell *cell = (FTextCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"FTextCell" owner:nil options:nil];
            
            for (id currentObject in nibObjects) {
                if([currentObject isKindOfClass:[FTextCell class]])
                {
                    cell = (FTextCell *)currentObject;
                }
            }
        }
        
        [cell setSNameAlt:[[cellTable objectAtIndex:[indexPath row]] FieldNameAlt]];
        [cell setSCellName:[[cellTable objectAtIndex:[indexPath row]] FieldName]];
        [cell setCellProperties];
        
        NSLog(@"%@", [[cellTable objectAtIndex:[indexPath row]] FieldNameAlt]);
        
        return cell;
    } else if ([cellIdentity isEqualToString:@"FChoiceCell"]) { // choice
        static NSString *cellIdentifier = @"FChoiceCell";
        
        FChoiceCell *cell = (FChoiceCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"FChoiceCell" owner:nil options:nil];
            
            for (id currentObject in nibObjects) {
                if([currentObject isKindOfClass:[FChoiceCell class]])
                {
                    cell = (FChoiceCell *)currentObject;
                }
            }
        }
        
        [cell setPickerDataSource:[jsonManipulator getChoiceListByID:[[cellTable objectAtIndex:[indexPath row]] FieldID]]];
        //NSLog(@"%@",[jsonManipulator getChoiceListByID:[[cellTable objectAtIndex:[indexPath row]] FieldID]]);
        [cell setSNameAlt:[[cellTable objectAtIndex:[indexPath row]] FieldNameAlt]];
        [cell setSCellName:[[cellTable objectAtIndex:[indexPath row]] FieldName]];
        [cell setCellProperties];
        
        return cell;
    } else if ([cellIdentity isEqualToString:@"FButtonCell"] && [flags isEqualToNumber:[NSNumber numberWithInt:0]]) { // checkbox
        static NSString *cellIdentifier = @"FCheckBoxCell";
        
        FCheckBoxCell *cell = (FCheckBoxCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"FCheckBoxCell" owner:nil options:nil];
            
            for (id currentObject in nibObjects) {
                if([currentObject isKindOfClass:[FCheckBoxCell class]])
                {
                    cell = (FCheckBoxCell *)currentObject;
                }
            }
        }
        
        //NSLog(@"%@",[jsonManipulator getChoiceListByID:[[cellTable objectAtIndex:[indexPath row]] FieldID]]);
        [cell setSNameAlt:[[cellTable objectAtIndex:[indexPath row]] FieldNameAlt]];
        [cell setSCellName:[[cellTable objectAtIndex:[indexPath row]] FieldName]];
        [cell setCellProperties];
        
        return cell;
    } else if ([cellIdentity isEqualToString:@"FButtonCell"] && [flags isEqualToNumber:[NSNumber numberWithInt:49152]]) { // optionbox
        static NSString *cellIdentifier = @"FChoiceCell";
        
        FChoiceCell *cell = (FChoiceCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"FChoiceCell" owner:nil options:nil];
            
            for (id currentObject in nibObjects) {
                if([currentObject isKindOfClass:[FChoiceCell class]])
                {
                    cell = (FChoiceCell *)currentObject;
                }
            }
        }
        
        [cell setPickerDataSource:[jsonManipulator getChoiceListByID:[[cellTable objectAtIndex:[indexPath row]] FieldID]]];
        //NSLog(@"%@",[jsonManipulator getChoiceListByID:[[cellTable objectAtIndex:[indexPath row]] FieldID]]);
        if ([[cellTable objectAtIndex:[indexPath row]] FieldNameAlt]) {
            [cell setSNameAlt:[[cellTable objectAtIndex:[indexPath row]] FieldNameAlt]];
        } else {
            [cell setSNameAlt:@"Vyberte jednu z možností"];
        }
        [cell setSCellName:[[cellTable objectAtIndex:[indexPath row]] FieldName]];
        [cell setCellProperties];
        
        return cell;
    } else { // neznama bunka
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        // Configure the cell...
        [cell setText:@"Neznama bunka"];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([[[cellTable objectAtIndex:[indexPath row]] FieldType] isEqualToString:@"Text"]) {
        // je to textova bunka
        return 57;
    } else if ([[[cellTable objectAtIndex:[indexPath row]] FieldType] isEqualToString:@"Choice"]) {
        // je to ine
        return 57;
    } else {
        return 50;
    }
}

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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
