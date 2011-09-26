//
//  HTTPLoader.m
//  HTTPLoader
//
//  Created by Björn Kaiser on 13.11.10.
//  Copyright 2010 mkb webprint. All rights reserved.
//

#import "HTTPLoader.h"


@implementation HTTPLoader

@synthesize delegate, responseData, url;


- (HTTPLoader*)initWithURL:(NSURL*)theURL andDelegate:(id<HTTPLoaderDelegate>)del {
	url = theURL;
	delegate = del;
	responseData = [[NSMutableData alloc] init];
	return self;
}

- (void)startDownload {
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

/**
 We failed to load the requested ressource :/
 **/
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    UIAlertView *errAl = [[UIAlertView alloc] initWithTitle:@"INSERT YOUR OWN ERROR TITLE" message:@"INSERT YOUR OWN ERROR MESSAGE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errAl show];
    [errAl release];
	NSLog(@"Error loading URL: %@", [error description]);
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[connection release];
	[delegate didFinishedDownloading:responseData];
	[responseData release];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void) dealloc {
	[super dealloc];
	[responseData release];
	[url release];
}

@end
