//
//  Calculate.m
//  BMR
//
//  Created by NIKUL CHAUHAN on 2/15/16.
//  Copyright © 2016 NIKUL CHAUHAN. All rights reserved.
//  Email ID: nikulchauhan@csu.fulerton.edu
//  Contact No: 714-213-5652
/*
    Description: It is a model.
 There is a implementation of two methods declare in file PersonBMR.h
 (1) To calculate BMR
 (2) If you want to loose 5 pounds in 3 months how much calories you need to take daily.
*/
#import "PersonBMR.h"

static PersonBMR* _sharedSingletonInstance;

@implementation PersonBMR

-(PersonBMR*) init
{
    self = [super init];
    return self;
}


+(void) initialize
{
    if( [PersonBMR class] == self ){
        _sharedSingletonInstance = [self new];
    }
}

+(PersonBMR *) getSharedSingletonInstance
{
    return _sharedSingletonInstance;
}

+(id) allocWithZone: (NSZone*) aZone
{
    if( _sharedSingletonInstance && [PersonBMR class] == self ){
        [NSException raise: NSGenericException format: @"May not create more than one instance of a singleton class!"];
    }
    return [super allocWithZone: aZone];
}
/*
+ (PersonBMR *)getPesronBMRObject {
    static PersonBMR *singletonInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        singletonInstance = [[self alloc] init];
    });
    
    return singletonInstance;
}
 */

- (NSNumber *) CalculateBMR {
    
    NSNumber *Result;
    if([self.PSex intValue] == 1)
    {
      Result = @( ([self.PWeight doubleValue] * 13.397) + ([self.PHeight doubleValue] * 4.799) - (5.677 * [self.PAge doubleValue]) + (88.362));
    }
    else
    {
        Result = @( ([self.PWeight doubleValue] * 9.247) + ([self.PHeight doubleValue] * 3.098) - (4.330 * [self.PAge doubleValue]) + (447.593));
    }
    return Result;
}

- (NSNumber *) CalculateDietResult:(NSNumber *) Result{
    NSNumber *DietResult;
    DietResult = @ ([Result doubleValue] - 38.88);
    return DietResult;
}
@end
