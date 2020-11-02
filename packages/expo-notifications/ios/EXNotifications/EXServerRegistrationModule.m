// Copyright 2018-present 650 Industries. All rights reserved.

#import <EXNotifications/EXServerRegistrationModule.h>

static NSString * const kEXDeviceInstallUUIDKey = @"EXDeviceInstallUUIDKey";

@implementation EXServerRegistrationModule

UM_EXPORT_MODULE(NotificationsServerRegistrationModule)

UM_EXPORT_METHOD_AS(getInstallationIdAsync, getInstallationIdAsyncWithResolver:(UMPromiseResolveBlock)resolve rejecter:(UMPromiseRejectBlock)reject)
{
  resolve([self getInstallationId]);
}

- (NSString *)getInstallationId
{
  NSString *uuid = [[NSUserDefaults standardUserDefaults] stringForKey:kEXDeviceInstallUUIDKey];
  if (!uuid) {
    uuid = [[NSUUID UUID] UUIDString];
    [[NSUserDefaults standardUserDefaults] setObject:uuid forKey:kEXDeviceInstallUUIDKey];
  }
  return uuid;
}

@end
