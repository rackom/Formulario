//
//  FTextCell.m
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import "FTextCell.h"

@implementation FTextCell

@synthesize sCellName;
@synthesize sNameAlt;
//
@synthesize FCellNameAlt;
@synthesize FCellTextField;

- (FTextCell *)initWithName:(NSString *)name andNameAlt:(NSString *)nameAlt {
    sCellName = name;
    sNameAlt = nameAlt;
    
    [self setCellProperties];
    
    return self;
}

- (void)setCellProperties {
    [FCellNameAlt setText:sNameAlt];
}

@end
