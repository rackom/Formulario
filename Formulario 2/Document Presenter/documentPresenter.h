//
//  documentPresenter.h
//  Formulario 2
//
//  Created by Michal Racko on 11/17/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellData.h"
#import "jsonManipulator.h"

#import "FTextCell.h"
#import "FChoiceCell.h"
#import "FCheckBoxCell.h"

@interface documentPresenter : UITableViewController

@property (nonatomic, retain) NSMutableArray *cellTable;

@end
