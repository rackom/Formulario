//
//  FirstViewControler.h
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface FirstViewControler : UITableViewController {
    NSMutableArray *documentTable;
    AppDelegate *ad;
}

@property (nonatomic, retain) NSMutableArray *documentTable;

@end
