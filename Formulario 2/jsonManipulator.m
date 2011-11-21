//
//  jsonManipulator.m
//  Formulario 2
//
//  Created by Michal Racko on 11/17/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import "jsonManipulator.h"

@implementation jsonManipulator

+ (NSMutableArray *)getAllDocuments {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", serverAddress, allDocuments]; 
    NSMutableArray *documentTable = [[NSMutableArray alloc] init];
    
	NSURL *url = [NSURL URLWithString:urlString];
	NSError *lookupError = nil;
	NSString *responseString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&lookupError];
    
    NSArray *results = [responseString JSONValue]; // tu mame pole z json response
    
    for (NSDictionary *elem in results) { // kazdy element pola je jeden dokument

        onlineDocumentCellValues *cell = [[onlineDocumentCellValues alloc] init];
        
        [cell setCellTitle:[elem objectForKey:@"name"]];
        [cell setCellDescription:[elem objectForKey:@"description"]];
        [cell setDocumentID:[elem valueForKey:@"id"]];
        
        [documentTable addObject:cell];
    }

    NSLog(@"Vraciam %d zaznamov", [documentTable count]);
    return documentTable;
}

+ (NSMutableArray *)getDocumentByID:(NSNumber *)documentID {
    
    NSString *urlString = [[NSString stringWithFormat:@"%@%@", serverAddress, specificDocument]
                           stringByReplacingOccurrencesOfString:@"{id}"
                           withString:[NSString stringWithFormat:@"%d", [documentID intValue]]];
    
    NSMutableArray *documentTable = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:urlString];
	NSError *lookupError = nil;
	NSString *responseString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&lookupError];
    
    NSDictionary *results = [responseString JSONValue]; // tu mame pole z json response
    NSArray *elements = [results objectForKey:@"elements"];
    
    for (NSDictionary *bunka in elements) {
        // 4. tu uz mame element
        
        // FieldFlags = 49152;
        // FieldJustification = Left;
        // FieldMaxLength = "<null>";
        // FieldName = "topmostSubform[0].Page1[0].VisuallyInteresting[0]";
        // FieldNameAlt = "<null>";
        // FieldType = Button;
        // id = 86;
        
        CellData *cell = [[CellData alloc] init];
        
        [cell setFieldID:[bunka objectForKey:@"id"]];
        [cell setFieldName:[bunka objectForKey:@"FieldName"]];
        [cell setFieldNameAlt:[bunka objectForKey:@"FieldNameAlt"]];
        [cell setFieldFlags:[bunka objectForKey:@"FieldFlags"]];
        [cell setFieldJustification:[bunka objectForKey:@"FieldJustification"]];
        [cell setFieldType:[bunka objectForKey:@"FieldType"]];
        [cell setFieldMaxLength:[bunka objectForKey:@"FieldMaxLength"]];
        
        NSLog(@"Mame %@ (\"%@\")", [cell FieldType], [cell FieldNameAlt]);
        
        [documentTable addObject:cell];
    }
    
    NSLog(@"Vraciam %d zaznamov", [documentTable count]);
    
    return documentTable;
}

+ (NSMutableArray *)getChoiceListByID:(NSNumber *)elementID {
    
    NSString *urlString = [[NSString stringWithFormat:@"%@%@", serverAddress, specificElement]
                           stringByReplacingOccurrencesOfString:@"{id}"
                           withString:[NSString stringWithFormat:@"%d", [elementID intValue]]];
    
    NSMutableArray *choiceList = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:urlString];
	NSError *lookupError = nil;
	NSString *responseString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&lookupError];
    
    NSDictionary *results = [responseString JSONValue]; // tu mame pole z json response
    NSArray *elements = [results objectForKey:@"state_options"];
    
    for (NSDictionary *bunka in elements) {
        // 4. tu uz mame element
        NSString *item = [bunka objectForKey:@"value"];
        
        [choiceList addObject:item];
    }
    
    NSLog(@"Vraciam %d choiceList zaznamov", [choiceList count]);
    
    return choiceList;
}

@end
