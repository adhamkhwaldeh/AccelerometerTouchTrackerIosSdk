//
//  BaseTouchObjcApplication.m
//  CodeExample
//
//  Created by adham khwaldeh on 9/6/25.
//

// BaseTouchObjcApplication.m
#import "BaseTouchObjCApplication.h"

@implementation BaseTouchObjCApplication

- (void)sendEvent:(UIEvent *)event {
    [super sendEvent:event];
    
    if (event.type == UIEventTypeTouches) {
        NSSet *touches = [event allTouches];
        if (self.onTouchesEvent) {
            self.onTouchesEvent(touches, event);
        }
    }
}

@end
