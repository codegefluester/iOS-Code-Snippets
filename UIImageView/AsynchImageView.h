//
//  AsynchImageView.h
//  AsynchImage
//
//  Created by app mac on 09.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AsynchImageView : UIImageView {
	NSMutableData *responseData;
}

@property (nonatomic, retain) NSMutableData *responseData;

@end
