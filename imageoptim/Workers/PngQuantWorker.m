//
//  PngQuantWorker.m
//  ImageOptim
//
//  Created by John Wong on 2/17/15.
//
//

#import "PngQuantWorker.h"

@implementation PngQuantWorker

- (instancetype)init {
    if ((self = [super init])) {
        
    }
    return self;
}

-(NSInteger)settingsIdentifier {
    return 1;
}

-(BOOL)runWithTempPath:(NSURL *)temp {
    NSMutableArray *args = [NSMutableArray arrayWithObjects:@"--force",@"--nofs",@"--output",file.filePathOptimized.path,file.filePathOptimized.path,nil];
    
    if (![self taskForKey:@"PngQuant" bundleName:@"pngquant" arguments:args]) {
        return NO;
    }
    
    NSPipe *commandPipe = [NSPipe pipe];
    NSFileHandle *commandHandle = [commandPipe fileHandleForReading];
    
    [task setStandardOutput: commandPipe];
    [task setStandardError: commandPipe];
    
    [self launchTask];
    
    [commandHandle readToEndOfFileInBackgroundAndNotify];
    
    [task waitUntilExit];
    
    [commandHandle closeFile];
    
    if ([task terminationStatus]) return NO;
    return YES;
}

@end
