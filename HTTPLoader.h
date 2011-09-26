//
//  HTTPLoader.h
//  HTTPLoader
//
//  Created by Björn Kaiser on 13.11.10.
//  Copyright 2010 mkb webprint. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPLoaderDelegate.h"

@interface HTTPLoader : NSObject {
	id<HTTPLoaderDelegate> delegate;
	
	NSMutableData *responseData;
	NSURL *url;
}

@property (nonatomic, retain) id<HTTPLoaderDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURL *url;

- (HTTPLoader*)initWithURL:(NSURL*)theURL andDelegate:(id<HTTPLoaderDelegate>)del;
- (void)startDownload;

@end
