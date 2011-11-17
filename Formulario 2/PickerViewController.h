//
//  PickerViewController.h
//  Formulario 2
//
//  Created by Michal Racko on 11/17/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerDelegate
- (void)itemSelected:(NSString *)text;
@end


@interface PickerViewController : UITableViewController {
    NSMutableArray *_items;
    id<PickerDelegate> _delegate;
}

@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, assign) id<PickerDelegate> delegate;

@end