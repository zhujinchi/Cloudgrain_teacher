//
//  MyPlatformViewObject.h
//  Runner
//
//  Created by jinchi zhu on 2020/9/25.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPlatformViewObject : NSObject <FlutterPlatformView>
- (id)initWithFrame:(CGRect)frame viewId:(int64_t)viewId args:(id)args;
@end

NS_ASSUME_NONNULL_END
