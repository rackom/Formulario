//
//  jsonManipulator.h
//  Formulario 2
//
//  Created by Michal Racko on 11/17/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LRResty/LRResty.h>
#import "SBJson.h"

#import "CellData.h"
#import "onlineDocumentCellValues.h"

#define serverAddress @"http://localhost:3000"
#define allDocuments @"/documents.json"
#define specificDocument @"/documents/{id}.json"
#define specificElement @"/elements/{id}.json"

@interface jsonManipulator : NSObject

+ (NSMutableArray *)getAllDocuments; // returns NSMutableArray of TableViewCells - each for one document
+ (NSMutableArray *)getDocumentByID:(NSNumber *)documentID; // return specific document by ID
+ (NSMutableArray *)getChoiceListByID:(NSNumber *)elementID; // return specific element`s choice list

@end
