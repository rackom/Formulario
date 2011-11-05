//
//  AppDelegate.h
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableArray *fileFieldList; 

- (void)downloadDataAboutFileAtURL:(NSString *)url;

@end
