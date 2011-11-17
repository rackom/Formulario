//
//  onlineDocumentCell.h
//  Formulario 2
//
//  Created by Michal Racko on 11/17/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface onlineDocumentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *cellTitle;
@property (strong, nonatomic) IBOutlet UILabel *cellDescription;

@property (nonatomic, retain) NSNumber *documentID;

@end
