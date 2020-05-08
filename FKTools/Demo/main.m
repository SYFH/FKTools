//
//  main.m
//  FKTools
//
//  Created by norld on 2020/5/7.
//  Copyright © 2020 norld. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FKTools.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        #pragma mark - Macro
        onExit { NSLog(@"main function end"); };
        { onExit { NSLog(@"scope end"); }; }
        
        #pragma mark - String Repeat
        NSLog(@"String Repeat: %@", [@"abc" repeatTimes:3]);
        NSLog(@"String Repeat: %@", [@"abc" repeatTimes:3 separate:@", "]);
        
        #pragma mark - String Formatter
        NSLog(@"String Formatter: %@", [NSString stringFromByteCount:234792858 countStyle:NSByteCountFormatterCountStyleFile]);
        
        #pragma mark - Sequence Generator
        NSArray *array = [NSSequenceGenerator generatorWithStart:4 length:10];
        NSLog(@"Sequence Generator: %@", array);
        NSLog(@"Sequence Generator: %@", NSStringFromClass([array.firstObject class]));
        
        array = [NSSequenceGenerator generatorWithStart:-4 length:10 step:2];
        NSLog(@"Sequence Generator: %@", array);
        NSLog(@"Sequence Generator: %@", NSStringFromClass([array.firstObject class]));
        
        array = [NSSequenceGenerator<NSString *> generatorWithStart:-4 length:10 execute:^NSString * _Nonnull(long long sequence) {
            
            return [[NSString stringWithFormat:@"%lld", sequence] repeatTimes:3 separate:@" !-! "];
        }];
        NSLog(@"Sequence Generator: %@", array);
    }
    return 0;
}
