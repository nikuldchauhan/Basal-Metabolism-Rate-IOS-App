//
//  Calculate.h
//  BMR
//
//  Created by NIKUL CHAUHAN on 2/15/16.
//  Copyright © 2016 NIKUL CHAUHAN. All rights reserved.
//  Email ID: nikulchauhan@csu.fulerton.edu
//  Contact No: 714-213-5652
//
/*
 Description:  There are  two methods declare
 (1) To calculate BMR
 (2) If you want to loose 5 pounds in 3 months how much calories you need to take daily.
 */
//
#import <Foundation/Foundation.h>

@interface PersonBMR : NSObject

@property (nonatomic, assign) NSNumber *PHeight;
@property (nonatomic, assign) NSNumber *PWeight;
@property (nonatomic, assign) NSNumber *PAge;
@property (nonatomic, assign) NSNumber *PSex;

- (NSNumber *) CalculateBMR;

//+ (PersonBMR *) getPesronBMRObject;

+(PersonBMR *) getSharedSingletonInstance;
- (NSNumber *) CalculateDietResult:(NSNumber *)Result;

@end
