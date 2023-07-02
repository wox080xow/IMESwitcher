#import <Foundation/Foundation.h>

@interface ISKLSelector : NSObject

// 在這裡聲明您的類方法或實例方法
- (void)selectInputMethod:(NSString *)inputMethodID;
- (void)selectKeyboardLayout:(NSString *)keyboardLayoutID;

@end
