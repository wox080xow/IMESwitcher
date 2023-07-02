#import "ISKLSelector.h"
#include <Carbon/Carbon.h>
#include <Foundation/Foundation.h>
#include <stdio.h>
#include <stdlib.h>

@implementation ISKLSelector : NSObject

// 在這裡聲明您的類方法或實例方法

- (void)selectInputMethod:(NSString *)inputMethodID {
  NSDictionary *inputMethodProperties =
      @{(NSString *)kTISPropertyInputSourceID : inputMethodID};
  NSArray *inputMethods = (NSArray *)TISCreateInputSourceList(
      (__bridge CFDictionaryRef)inputMethodProperties, true);

  if ([inputMethods count] > 0) {
    TISInputSourceRef inputMethod =
        (__bridge TISInputSourceRef)[inputMethods objectAtIndex:0];
    TISEnableInputSource(inputMethod);
    TISSelectInputSource(inputMethod);
  }
}

- (void)selectKeyboardLayout:(NSString *)keyboardLayoutID {
  NSDictionary *keyboarLayoutProperties =
      @{(NSString *)kTISPropertyInputSourceID : keyboardLayoutID};
  NSArray *keyboardLayouts = (NSArray *)TISCreateInputSourceList(
      (__bridge CFDictionaryRef)keyboarLayoutProperties, true);

  if ([keyboardLayouts count] > 0) {
    TISInputSourceRef keyboardLayout =
        (TISInputSourceRef)[keyboardLayouts objectAtIndex:0];
    TISEnableInputSource(keyboardLayout);
    TISSelectInputSource(keyboardLayout);
  }
}

@end

int main(int argc, char const *const *argv) {
  @autoreleasepool {
    // 創建 ISKLSelector 的實例
    ISKLSelector *isklSelector = [[ISKLSelector alloc] init];

    // 使用實例調用 : selectKeyboardLayout 函式
    NSString *keyboardLayoutID = [NSString stringWithUTF8String:argv[2]];
    [isklSelector selectKeyboardLayout:keyboardLayoutID];

    // 使用實例調用 : selectInputMethod 函式
    NSString *inputMethodID = [NSString stringWithUTF8String:argv[1]];
    [isklSelector selectInputMethod:inputMethodID];
  }
}