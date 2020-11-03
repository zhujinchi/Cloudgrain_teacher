//
//  MyPlatformViewFactory.m
//  Runner
//
//  Created by jinchi zhu on 2020/9/25.
//

#import "MyPlatformViewFactory.h"
#import "MyPlatformViewObject.h"

@implementation MyPlatformViewFactory

- (NSObject <FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args
{
    MyPlatformViewObject *myPlatformViewObject = [[MyPlatformViewObject alloc] initWithFrame:frame viewId:(viewId) args:args];
    return myPlatformViewObject;
}

@end
