//
//  onlineDocumentCellValues.h
//  Formulario 2
//
//  Created by Michal Racko on 11/17/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface onlineDocumentCellValues : NSObject

@property (strong, nonatomic) NSString *cellTitle;
@property (strong, nonatomic) NSString *cellDescription;

@property (nonatomic, retain) NSNumber *documentID;

@end
