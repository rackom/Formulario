//
//  FTextCell.m
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import "FChoiceCell.h"

@implementation FChoiceCell

@synthesize sCellName;
@synthesize sNameAlt;
@synthesize pickerDataSource;
//
@synthesize FCellNameAlt;
@synthesize PickerButton;
@synthesize itemPicker = _itemPicker;
@synthesize itemPickerPopover = _itemPickerPopover;

- (FChoiceCell *)initWithName:(NSString *)name andNameAlt:(NSString *)nameAlt {
    sCellName = name;
    sNameAlt = nameAlt;
    
    [self setCellProperties];
    
    return self;
}

- (void)itemSelected:(NSString *)text {
    [[self PickerButton] setTitle:text forState:UIControlStateNormal];
    [self.itemPickerPopover dismissPopoverAnimated:YES];
}

- (IBAction)setItemButtonTapped:(id)sender {
    if (_itemPicker == nil) {
        self.itemPicker = [[PickerViewController alloc] 
                             initWithStyle:UITableViewStylePlain];
        _itemPicker.delegate = self;
        _itemPicker.items = pickerDataSource;
        self.itemPickerPopover = [[UIPopoverController alloc] 
                                    initWithContentViewController:_itemPicker];   

    }
    [self.itemPickerPopover presentPopoverFromRect:PickerButton.bounds inView:PickerButton 
                     permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)setCellProperties {
    if ((NSNull *) sNameAlt == [NSNull null]) {
        [FCellNameAlt setText:@"-"];
    } else {
        [FCellNameAlt setText:sNameAlt];
    }
}

@end
