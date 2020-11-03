#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <Flutter/Flutter.h>
#import "MyPlatformViewFactory.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;

    FlutterMethodChannel *CHANNEL = [FlutterMethodChannel methodChannelWithName:@"com.flutter.epic/epic" binaryMessenger:controller];

    [CHANNEL setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"Printy" isEqualToString:call.method]) {
            result(@"Hi From Objective-C_zhujinchi");
        }
    }];
    
    [GeneratedPluginRegistrant registerWithRegistry:self];
    MyPlatformViewFactory *myPlatformViewFactory = [[MyPlatformViewFactory alloc] init];
    [[self registrarForPlugin:@"Lipuzhi"] registerViewFactory:myPlatformViewFactory withId:@"MyUiKitView"];
    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
