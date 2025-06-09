//
//  BaseTouchObjcApplication.m
//  CodeExample
//
//  Created by adham khwaldeh on 9/6/25.
//

#import "BaseTouchObjCApplication.h"

@implementation BaseTouchObjCApplication

// BaseTouchObjCApplication.m

- (instancetype)init {
    self = [super init];
    if (self) {
        _listeningEnabled = YES;
//        isListeningEnabled = YES;
    }
    return self;
}

- (void)sendEvent:(UIEvent *)event {
    [super sendEvent:event];
    
    if (event.type == UIEventTypeTouches) {
        NSSet *touches = [event allTouches];
        if (self.onTouchesEvent) {
            {
                if (self.isListeningEnabled && event.type == UIEventTypeTouches && touches.count > 0) {
                    {
                        self.onTouchesEvent(touches, event);
                    }
                }
            }
        }
    }
}

- (void)startListening { self.listeningEnabled = YES; }

- (void)stopListening { self.listeningEnabled = NO; }


@end
