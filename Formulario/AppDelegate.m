//
//  AppDelegate.m
//  Formulario
//
//  Created by Michal Racko on 10/29/11.
//  Copyright (c) 2011 STU - FIIT. All rights reserved.
//

#import "AppDelegate.h"
#import <LRResty/LRResty.h>
#import "SBJson.h"

//cells
#import "CellData.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize fileFieldList;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[self downloadDataAboutFileAtURL:@"http://localhost:3000/documents.json"];
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

// vlastne metody

- (void)downloadDataAboutFileAtURL:(NSString *)url {
    //
    // pokus na ziskanie PDF struktury
    //
    
    // The url to make the request to
    [fileFieldList removeAllObjects];
    
    [[LRResty client] get:url withBlock:^(LRRestyResponse *r) {
        NSString *responseString = [r asString];
        //
        
        // 1. the top level value is an array
        NSArray *results = [responseString JSONValue];
        
        // 2. each element in the array is an object/dictionary with
        // a single key called "user"
        for (NSDictionary *elem in results) {
            // 3. the value of the "user" key is itself another object/dictionary
            // with various key-value pairs
            // element obsahuje polia prvkov
            NSArray *element = [elem objectForKey:@"elements"];
            
            for (NSDictionary *bunka in element) {
                // 4. tu uz mame element
                /*
                 FieldFlags = 49152;
                 FieldJustification = Left;
                 FieldMaxLength = "<null>";
                 FieldName = "topmostSubform[0].Page1[0].VisuallyInteresting[0]";
                 FieldNameAlt = "<null>";
                 FieldType = Button;
                 id = 86;
                 */
                
                CellData *cell = [[CellData alloc] init];
                
                [cell setFieldName:[bunka objectForKey:@"FieldName"]];
                [cell setFieldNameAlt:[bunka objectForKey:@"FieldNameAlt"]];
                [cell setFieldFlags:[bunka objectForKey:@"FieldFlags"]];
                [cell setFieldJustification:[bunka objectForKey:@"FieldJustification"]];
                [cell setFieldType:[bunka objectForKey:@"FieldType"]];
                [cell setFieldMaxLength:[bunka objectForKey:@"FieldMaxLength"]];
                
                NSLog(@"Mame %@ (\"%@\")", [cell FieldType], [cell FieldNameAlt]);
                
                [fileFieldList addObject:cell];
            }
        }
    }];
}

@end
