//
//  AsynchImageView.m
//  AsynchImage
//
//  Created by app mac on 09.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AsynchImageView.h"


@implementation AsynchImageView

@synthesize responseData;

- (id)initWithURL:(NSURL *)imageURL {
	[super init];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:imageURL];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
	NSLog(@"go url: %@", imageURL);
	return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	responseData = [[NSMutableData alloc] init];
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
	self.image = [UIImage imageWithData:self.responseData];
	[self setFrame:CGRectMake(0, 0, self.image.size.width, self.image.size.height)];
	[responseData release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[connection release];
	NSLog(@"%@", [error description]);
}

- (void)dealloc {
	[super dealloc];
	[responseData release];
}

@end
