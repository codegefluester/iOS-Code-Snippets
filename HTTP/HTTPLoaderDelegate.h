//
//  HTTPLoaderDelegate.h
//  HTTPLoader
//
//  Created by Björn Kaiser on 13.11.10.
//  Copyright 2010 mkb webprint. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HTTPLoaderDelegate

@optional

- (void)didFinishedDownloading:(NSMutableData*)data;


@end
