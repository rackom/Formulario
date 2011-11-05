//
//  CellData.h
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellData : NSObject {
    NSString *FieldType;
    NSString *FieldName;
    NSString *FieldNameAlt;
    NSNumber *FieldFlags;
    NSString *FieldJustification;
    NSNumber *FieldMaxLength;
}


@property (nonatomic, retain) NSString *FieldType;
@property (nonatomic, retain) NSString *FieldName;
@property (nonatomic, retain) NSString *FieldNameAlt;
@property (nonatomic, retain) NSNumber *FieldFlags;
@property (nonatomic, retain) NSString *FieldJustification;
@property (nonatomic, retain) NSNumber *FieldMaxLength;

@end
