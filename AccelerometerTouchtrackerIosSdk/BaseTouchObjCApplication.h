//
//  BaseTouchObjCApplication.h
//  CodeExample
//
//  Created by adham khwaldeh on 9/6/25.
//

#import <UIKit/UIKit.h>

@interface BaseTouchObjCApplication : UIApplication

@property (nonatomic, copy) void (^onTouchesEvent)(NSSet<UITouch *> *touches, UIEvent *event);

@end
