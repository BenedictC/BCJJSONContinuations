//
//  BCJValidation.m
//  BCJJSONContinuations
//
//  Created by Benedict Cohen on 31/10/2014.
//  Copyright (c) 2014 Benedict Cohen. All rights reserved.
//

#import "BCLContinuation.h"
#import "BCJCore.h"



#pragma mark - Type checking continuations
BOOL BCJ_OVERLOADABLE BCJIsOfKindClass(id value, Class class, NSError **outError) {
    BOOL isValid = [value isKindOfClass:class];
    if (!isValid) {
        if (outError != NULL) *outError = [NSError errorWithDomain:@"TODO: wrong class type" code:0 userInfo:nil];
        return NO;
    }

    return YES;
}



#pragma mark - Validation functions
BOOL BCJ_OVERLOADABLE BCJValidate(id value, NSPredicate *predicate, NSError **outError) {
    BOOL isValid = [predicate evaluateWithObject:value];
    if (!isValid) {
        if (outError != NULL) *outError = [NSError errorWithDomain:@"TODO: value did not pass validation" code:0 userInfo:nil];
        return NO;
    }

    return YES;
}



BOOL BCJ_OVERLOADABLE BCJValidate(id value, NSString *predicateString, NSError **outError) {
    return BCJValidate(value, [NSPredicate predicateWithFormat:predicateString], outError);
}



#pragma mark - Validation setter function
BOOL BCJ_OVERLOADABLE BCJValidateAndSet(id value, NSPredicate *predicate, id target, NSString *targetKey, NSError **outError) {
    if (!BCJValidate(value, predicate, outError)) return NO;

    return BCJSetValue(value, target, targetKey, outError);
}



BOOL BCJ_OVERLOADABLE BCJValidateAndSet(id value, NSString *predicateString, id target, NSString *targetKey, NSError **outError) {
    return  BCJValidateAndSet(value, [NSPredicate predicateWithFormat:predicateString], target, targetKey, outError);
}

