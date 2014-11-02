//
//  BCJGettersAndSetter.h
//  BCJJSONContinuations
//
//  Created by Benedict Cohen on 01/11/2014.
//  Copyright (c) 2014 Benedict Cohen. All rights reserved.
//

#import "BCLContinuation.h"
#import "BCJConstants.h"
#import "BCJDefines.h"
#import "BCJContainerProtocols.h"



//(Get arbitary object functions are in BCJCore)



#pragma mark - Get arbitary object continuations
//Block result-style
id<BCLContinuation> BCJ_OVERLOADABLE BCJGetValue(id<BCJIndexedContainer> array, NSUInteger idx, Class class, BCJGetterOptions options, id defaultValue, BOOL(^successBlock)(id value, NSError **outError)) __attribute__((nonnull(1,3,6)));

id<BCLContinuation> BCJ_OVERLOADABLE BCJGetValue(id<BCJKeyedContainer> dict, id key, Class class, BCJGetterOptions options, id defaultValue, BOOL(^successBlock)(id value, NSError **outError)) __attribute__((nonnull(1,2,3,6)));



#pragma mark - Set arbitary object continuations
//KVC result-style
id<BCLContinuation> BCJ_OVERLOADABLE BCJSetValue(id<BCJIndexedContainer> array, NSUInteger idx, Class class, BCJGetterOptions options, id defaultValue, id target, NSString *targetKey) __attribute__((nonnull(1,3,6,7)));

id<BCLContinuation> BCJ_OVERLOADABLE BCJSetValue(id<BCJKeyedContainer> dict, id key, Class class, BCJGetterOptions options, id defaultValue, id target, NSString *targetKey) __attribute__((nonnull(1,2,3,6,7)));

//outValue result-style
id<BCLContinuation> BCJ_OVERLOADABLE BCJSetValue(id<BCJIndexedContainer> array, NSUInteger idx, Class class, BCJGetterOptions options, id defaultValue, id __strong *outValue) __attribute__((nonnull(1,3,6)));

id<BCLContinuation> BCJ_OVERLOADABLE BCJSetValue(id<BCJKeyedContainer> dict, id key, Class class, BCJGetterOptions options, id defaultValue, id __strong *outValue) __attribute__((nonnull(1,2,3,6)));