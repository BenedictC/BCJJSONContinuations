//
//  main.m
//  TypeCheckedCollectionAccess
//
//  Created by Benedict Cohen on 20/10/2014.
//  Copyright (c) 2014 Benedict Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AttemptSalvage.h"
#import "BCLContinuation.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSDictionary *json = @{@"number": @7,
                               @"string": @"arf"};

//      //Plain function access
//        void (^handleError)(NSError *) = ^(NSError *error){
//            [error self];
//        };
//        id value;
//        NSError *error;
//        //Function with error returned
//        if ((error = BCLArrayGetMandatoryObject(@[], 0, [NSArray class], &value))) handleError(error);
//        //Function with status returned
//        if (BCLArrayGetMandatoryObject(@[], 0, [NSArray class], &value, &error)) handleError(error);
//        //Function with completion block
//        BCLArrayGetMandatoryObject(@[], 0, [NSArray class], ^(BOOL didSucceed, id value, NSError *error){
//
//        });



//        //Macro control-flow
//        ATTEMPT({
//            BCMSetAbandonOnError(YES);
//            NSNumber *number  = BCMDictionaryGetMandatoryObject(json, @"number", [NSNumber class]);
//
//            NSInteger integer = BCMDictionaryGetMandatoryInteger(json, @"number");
//            id string = BCMDictionaryGetMandatoryString(json, @"number");
//            [string self];
//
//            NSLog(@"%@, %ld", number, integer);
//        })
//        SALVAGE({
//            NSLog(@"Failed with errors: %@", BCMGetErrors());
//        });



//Continuation
        [BCLContinuation untilEnd:
         BCJDictionaryGetOptionalObject(json, @"number", NSNumber.class, @0, ^(NSNumber *value){
            
        }),
         BCJDictionaryGetOptionalObject(json, @"number", NSNumber.class, @0, ^(NSNumber *value){
        }),
         nil];
        
    }
    return 0;
}
