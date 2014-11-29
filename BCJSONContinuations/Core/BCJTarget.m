//
//  BCJTarget.m
//  BCJJSONContinuations
//
//  Created by Benedict Cohen on 04/11/2014.
//  Copyright (c) 2014 Benedict Cohen. All rights reserved.
//

#import "BCJTarget+ValueIntrospection.h"

#import "BCJDefines.h"
#import "BCJError.h"



@implementation BCJTarget

-(instancetype)init
{
    return [self initWithObject:nil keyPath:nil];
}



-(instancetype)initWithObject:(id)object keyPath:(NSString *)keyPath;
{
    NSParameterAssert(object != nil);
    NSParameterAssert(keyPath != nil && keyPath.length > 0);

    self = [super init];
    if (self == nil) return nil;

    _object = object;
    _keyPath = [keyPath copy];

    return self;
}



-(BOOL)setValue:(id)value error:(NSError **)outError;
{
    //KVC will work regardless of type which means type mismatch bugs can occur. We add type checking for DEBUG builds to catch these bugs early.
    NSAssert([self canReceiveValue:value] != BCJTargetValueEligabilityStatusForbidden, @"Attempted to set an object of type <%@> to an ivar of type <%@> for key <%@> of object <%@>.", NSStringFromClass([value class]), NSStringFromClass([self expectedClass]), self.key, self.object);

    //Validate using KVC
    id validatedValue = value;
    if (![self.object validateValue:&validatedValue forKeyPath:self.key error:outError]) {
        //We don't need to populate outError because validateValue:forKey:error: has already done so.
        return NO;
    }

    //Note that we're using the validatedValue
#pragma message "TODO: Change this to setValue:forKeyPath:. Rename the class and update the value introspection to parse the path"
    [self.object setValue:validatedValue forKeyPath:self.key];
    return YES;
}

@end



BCJTarget * BCJ_OVERLOADABLE BCJCreateTarget(id object, NSString *keyPath) {
    return [[BCJTarget alloc] initWithObject:object keyPath:keyPath];
}