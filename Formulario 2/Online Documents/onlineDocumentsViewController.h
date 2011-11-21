//
//  onlineDocumentsViewController.h
//  Formulario 2
//
//  Created by Michal Racko on 11/17/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jsonManipulator.h"
#import "onlineDocumentCell.h"
#import "documentPresenter.h"

@interface onlineDocumentsViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *documentArray;

@end
