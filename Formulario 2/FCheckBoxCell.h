//
//  FTextCell.h
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCheckBoxCell : UITableViewCell {
    NSString *sNameAlt;
    NSString *sCellName;
    
    IBOutlet UILabel *FCellNameAlt;
}

@property (nonatomic, retain) NSString *sNameAlt;
@property (nonatomic, retain) NSString *sCellName;

//

@property (strong, nonatomic) IBOutlet UISwitch *FCheckBox;
@property (strong, nonatomic) IBOutlet UILabel *FCellNameAlt;

// init metoda pre bunku
- (FCheckBoxCell *)initWithName:(NSString *)name andNameAlt:(NSString *)nameAlt;

// metoda na nastavenie viditelnych nazvov bunky
- (void)setCellProperties;

@end
