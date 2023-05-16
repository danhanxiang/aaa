#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UmengCommonSdkPlugin.h"

FOUNDATION_EXPORT double umeng_common_sdkVersionNumber;
FOUNDATION_EXPORT const unsigned char umeng_common_sdkVersionString[];

