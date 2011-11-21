//
//  FTextCell.m
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import "FCheckBoxCell.h"

@implementation FCheckBoxCell

@synthesize sCellName;
@synthesize FCheckBox;
@synthesize sNameAlt;
//
@synthesize FCellNameAlt;

- (FCheckBoxCell *)initWithName:(NSString *)name andNameAlt:(NSString *)nameAlt {
    sCellName = name;
    sNameAlt = nameAlt;
    
    [self setCellProperties];
    
    return self;
}

- (void)setCellProperties {
    if ((NSNull *) sNameAlt == [NSNull null]) {
        [FCellNameAlt setText:@"-"];
    } else {
        [FCellNameAlt setText:sNameAlt];
    }
}

@end
