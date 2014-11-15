//
//  BCJJSONSource+LateBoundClassCheck.h
//  BCJJSONContinuations
//
//  Created by Benedict Cohen on 08/11/2014.
//  Copyright (c) 2014 Benedict Cohen. All rights reserved.
//

#import "BCJJSONSource.h"



@interface BCJJSONSource (LateBoundClassCheck)

/**
 Calls getValue:error: and then performs an additional type check. This method is used by type-specific continuations so that sources can be created without an expectedClass.

 @param value           On success contains the fetched value, otherwise nil.
 @param lateBoundClass  The expected class.
 @param outError        On failure contains an NSError describing the reason for failure, otherwise nil.

 @return The result status.
 */
-(BCJSourceResult)getValue:(id *)value ofKind:(Class)lateBoundClass error:(NSError **)outError;

@end
