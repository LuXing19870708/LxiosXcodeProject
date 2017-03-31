//
//  LxKeychainUtils.h
//  LxiosXcodeProject
//
//  Created by LUXING on 2017/3/31.
//  Copyright © 2017年 LUXING. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LxKeychainUtils : NSObject

/*
 my personal team id is CRBCTALN3V
*/

/*
   App must register the group that it wants to access(write or read data)
 
   By default,without any registration,App can acess the group: {TeamID}.{SelfBundleID}
 
   {TeamID}.* is a special group which all apps with the same TeamID can access,but registration for this group is still necessary
*/

+(NSMutableDictionary*)keychainQueryDictionary:(NSString*)key;


+(int)save:(NSString*)key data:(id)data group:(NSString*)group;
+(int)save:(NSString*)key data:(id)data;


+(id)load:(NSString*)key group:(NSString*)group;
+(id)load:(NSString*)key;

@end
