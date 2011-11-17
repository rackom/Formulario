//
//  FTextCell.h
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PickerViewController.h"

@interface FChoiceCell : UITableViewCell <PickerDelegate> {
    NSString *sNameAlt; // popis bunky
    NSString *sCellName; // nazov bunky
    NSMutableArray *pickerDataSource;
    
    IBOutlet UILabel *FCellNameAlt;
    
    PickerViewController *_itemPicker;
    UIPopoverController *_itemPickerPopover;
}

@property (nonatomic, retain) NSString *sNameAlt;
@property (nonatomic, retain) NSString *sCellName;
@property (nonatomic, retain) NSMutableArray *pickerDataSource;

//

@property (strong, nonatomic) IBOutlet UILabel *FCellNameAlt;
@property (strong, nonatomic) IBOutlet UIButton *PickerButton;

@property (nonatomic, retain) PickerViewController *itemPicker;
@property (nonatomic, retain) UIPopoverController *itemPickerPopover;

// init metoda pre bunku
- (FChoiceCell *)initWithName:(NSString *)name andNameAlt:(NSString *)nameAlt;

// metoda na nastavenie viditelnych nazvov bunky
- (void)setCellProperties;

- (IBAction)setItemButtonTapped:(id)sender;

@end
