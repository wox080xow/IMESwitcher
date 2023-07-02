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
    const char pre[] = "重置輸入法\n";
    fprintf(stdout, pre);

    // 創建 ISKLSelector 的實例
    ISKLSelector *isklSelector = [[ISKLSelector alloc] init];
    // 重置輸入法
    NSString *keyboardLayoutID = @"com.apple.keylayout.ABC";
    [isklSelector selectKeyboardLayout:keyboardLayoutID];

    NSString *inputMethodID = @"com.apple.keylayout.ABC";
    [isklSelector selectInputMethod:inputMethodID];
  }

  TISInputSourceRef inputSourceKL = TISCopyCurrentKeyboardLayoutInputSource();
  NSString *inputSourceIDKL =
      TISGetInputSourceProperty(inputSourceKL, kTISPropertyInputSourceID);
  NSString *localizedNameKL =
      TISGetInputSourceProperty(inputSourceKL, kTISPropertyLocalizedName);
  printf("KL: %s (%s)\n", [inputSourceIDKL UTF8String],
         [localizedNameKL UTF8String]);
  CFRelease(inputSourceKL);

  TISInputSourceRef inputSource = TISCopyCurrentKeyboardInputSource();
  NSString *inputSourceID =
      TISGetInputSourceProperty(inputSource, kTISPropertyInputSourceID);
  NSString *localizedName =
      TISGetInputSourceProperty(inputSource, kTISPropertyLocalizedName);
  printf("IS: %s (%s)\n", [inputSourceID UTF8String],
         [localizedName UTF8String]);
  CFRelease(inputSource);

  id pool = [NSAutoreleasePool new];
  if ((argc > 2 && strcmp(argv[2], "com.apple.keylayout.ABC") == 0)) {
    // 處理KeyboardLayout「是」com.apple.keylayout.ABC者
    const char con1[] = "「是」com.apple.keylayout.ABC\n";
    fprintf(stdout, con1);
    // 創建 ISKLSelector 的實例
    ISKLSelector *isklSelector = [[ISKLSelector alloc] init];

    // 使用實例調用 : selectKeyboardLayout 函式
    NSString *keyboardLayoutID = [NSString stringWithUTF8String:argv[2]];
    [isklSelector selectKeyboardLayout:keyboardLayoutID];

    // 使用實例調用 : selectInputMethod 函式
    NSString *inputMethodID = [NSString stringWithUTF8String:argv[1]];
    [isklSelector selectInputMethod:inputMethodID];

    TISInputSourceRef inputSourceKL = TISCopyCurrentKeyboardLayoutInputSource();
    NSString *inputSourceIDKL =
        TISGetInputSourceProperty(inputSourceKL, kTISPropertyInputSourceID);
    NSString *localizedNameKL =
        TISGetInputSourceProperty(inputSourceKL, kTISPropertyLocalizedName);
    printf("KL: %s (%s)\n", [inputSourceIDKL UTF8String],
           [localizedNameKL UTF8String]);
    CFRelease(inputSourceKL);

    TISInputSourceRef inputSource = TISCopyCurrentKeyboardInputSource();
    NSString *inputSourceID =
        TISGetInputSourceProperty(inputSource, kTISPropertyInputSourceID);
    NSString *localizedName =
        TISGetInputSourceProperty(inputSource, kTISPropertyLocalizedName);
    printf("IS: %s (%s)\n", [inputSourceID UTF8String],
           [localizedName UTF8String]);
    CFRelease(inputSource);
  } else if (argc > 2 && strcmp(argv[2], "com.apple.keylayout.ABC") != 0) {
    // 處理KeyboardLayout「非」com.apple.keylayout.ABC者
    const char con2[] = "「非」com.apple.keylayout.ABC\n";
    fprintf(stdout, con2);
    // 創建 ISKLSelector 的實例
    ISKLSelector *isklSelector = [[ISKLSelector alloc] init];

    // 使用實例調用 : selectInputMethod 函式
    NSString *inputMethodID = [NSString stringWithUTF8String:argv[1]];
    [isklSelector selectInputMethod:inputMethodID];

    // 使用實例調用 : selectKeyboardLayout 函式
    NSString *keyboardLayoutID = [NSString stringWithUTF8String:argv[2]];
    [isklSelector selectKeyboardLayout:keyboardLayoutID];

    TISInputSourceRef inputSourceKL = TISCopyCurrentKeyboardLayoutInputSource();
    NSString *inputSourceIDKL =
        TISGetInputSourceProperty(inputSourceKL, kTISPropertyInputSourceID);
    NSString *localizedNameKL =
        TISGetInputSourceProperty(inputSourceKL, kTISPropertyLocalizedName);
    printf("KL: %s (%s)\n", [inputSourceIDKL UTF8String],
           [localizedNameKL UTF8String]);
    CFRelease(inputSourceKL);

    TISInputSourceRef inputSource = TISCopyCurrentKeyboardInputSource();
    NSString *inputSourceID =
        TISGetInputSourceProperty(inputSource, kTISPropertyInputSourceID);
    NSString *localizedName =
        TISGetInputSourceProperty(inputSource, kTISPropertyLocalizedName);
    printf("IS: %s (%s)\n", [inputSourceID UTF8String],
           [localizedName UTF8String]);
    CFRelease(inputSource);
  } else {
    const char usage[] =
        "Usage: IMESwitcher <InputSource> <KeyboardLayout>\n\n";
    fprintf(stderr, usage);
  }
  [pool release];
}