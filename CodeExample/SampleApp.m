//
//  SampleApp.m
//  CodeExample
//

#import "SampleApp.h"

@interface SampleApp ()

@end

@implementation SampleApp

+ (id)sharedSampleApp
{
    static SampleApp *sampleApp = nil;
    @synchronized(self)
    {
        if (sampleApp == nil)
            sampleApp = [[self alloc] init];
    }
    return sampleApp;
}

-(id) init
{
    self = [super init];
    return self;
}

@end
