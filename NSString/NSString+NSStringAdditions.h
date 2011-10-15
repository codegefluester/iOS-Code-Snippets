//
//  NSString+NSStringAdditions.h
//  iOS snippets by codegefluester
//
//  Created by Björn Kaiser on 15.10.11.
//  Copyright (c) 2011 B2 Communications GmbH. All rights reserved.
//

#import <Foundation/NSString.h>

@interface NSString (NSStringAdditions)

+ (NSString *) base64StringFromData:(NSData *)data length:(int)length;

@end
