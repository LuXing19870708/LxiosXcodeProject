//
//  LxKeychainUtils.m
//  LxiosXcodeProject
//
//  Created by LUXING on 2017/3/31.
//  Copyright © 2017年 LUXING. All rights reserved.
//

#import "LxKeychainUtils.h"

@implementation LxKeychainUtils

+(NSMutableDictionary*)keychainQueryDictionary:(NSString *)key{

    if(key && [key length]>0){
        
        return [NSMutableDictionary dictionaryWithObjectsAndKeys:
                (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
                key,(__bridge_transfer id)kSecAttrService,
                key,(__bridge_transfer id)kSecAttrAccount,
                (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
                nil];
    }
    
    else{
        return nil;
    }
}


//the data to be added must implement the protocol NSCoding
+(int)save:(NSString*)key data:(id)data group:(NSString*)group{
    
    if (key && ([key length]>0) && data){
        
        
        //get search dictionary
        NSMutableDictionary *keychainQuery = [LxKeychainUtils keychainQueryDictionary:key];
        
        
        if (group && [group length]>0) {
            
            //set the access group
            [keychainQuery setObject:group
                              forKey:(__bridge_transfer id)kSecAttrAccessGroup];
        
        }
        
       
        //delete the old value if it exists before adding the new value
        SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
        
        
        //add new value object to search dictionary
        [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data]
                          forKey:(__bridge_transfer id)kSecValueData];
        
       
        //execute adding
        OSStatus rst = SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
        
        NSLog(@"(save:%@ data:* group:%@) rst = %d",key,group,rst);
        
        return rst;
    }
    
    else{
        return -404;
    }
    
}



+(int)save:(NSString*)key data:(id)data{
   return [LxKeychainUtils save:key data:data group:nil];
}


+(id)load:(NSString*)key group:(NSString*)group{
    
    id rst = nil;
    
    if(key && [key length]>0){
        
        NSMutableDictionary *keychainQuery = [LxKeychainUtils keychainQueryDictionary:key];
        
        if (group && [group length]>0) {
            
            //set the access group
            [keychainQuery setObject:group
                              forKey:(__bridge_transfer id)kSecAttrAccessGroup];
        }
        
        
        
        //configure the search setting
        [keychainQuery setObject:(id)kCFBooleanTrue
                          forKey:(__bridge_transfer id)kSecReturnData];
        
        [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne
                          forKey:(__bridge_transfer id)kSecMatchLimit];
        
        CFDataRef keyData = NULL;
        
        if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
            
            @try {
                rst = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
            }
            @catch(NSException *e){
                NSLog(@"unarchive of %@ failed: %@", key, e.description);
            }
            @finally{
            }
        }
        
    }
    
    return rst;
}

+(id)load:(NSString*)key{
   return [LxKeychainUtils load:key group:nil];
}



@end
