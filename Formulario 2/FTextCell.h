//
//  FTextCell.h
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTextCell : UITableViewCell {
    NSString *sNameAlt;
    NSString *sCellName;
    
    IBOutlet UILabel *FCellNameAlt;
    IBOutlet UITextField *FCellTextField;
}

@property (nonatomic, retain) NSString *sNameAlt;
@property (nonatomic, retain) NSString *sCellName;

//

@property (strong, nonatomic) IBOutlet UILabel *FCellNameAlt;
@property (strong, nonatomic) IBOutlet UITextField *FCellTextField;

// init metoda pre bunku
- (FTextCell *)initWithName:(NSString *)name andNameAlt:(NSString *)nameAlt;

// metoda na nastavenie viditelnych nazvov bunky
- (void)setCellProperties;

@end
