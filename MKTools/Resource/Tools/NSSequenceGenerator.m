//  MIT License
//
//  Copyright (c) 2020 Norld
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "NSSequenceGenerator.h"

typedef id(^Execute)(long long sequence);

@interface NSSequenceGenerator ()

@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign) NSUInteger length;
@property (nonatomic, assign) NSUInteger step;
@property (nonatomic, strong) Execute execute;

@end

@implementation NSSequenceGenerator

+ (NSArray *)generatorWithStart:(NSInteger)start length:(NSUInteger)length {
    return [[NSSequenceGenerator alloc] arrayWithStart:start length:length step:1 execute:nil];
}

+ (NSArray *)generatorWithStart:(NSInteger)start length:(NSUInteger)length execute:(Execute)execute {
    return [[NSSequenceGenerator alloc] arrayWithStart:start length:length step:1 execute:execute];
}

+ (NSArray *)generatorWithStart:(NSInteger)start length:(NSUInteger)length step:(NSUInteger)step {
    return [[NSSequenceGenerator alloc] arrayWithStart:start length:length step:step execute:nil];
}

- (NSArray *)arrayWithStart:(NSInteger)start length:(NSUInteger)length step:(NSUInteger)step execute:(Execute)execute {
    NSSequenceGenerator *generator = [[NSSequenceGenerator alloc] init];
    generator.start = start;
    generator.length = length;
    generator.step = step;
    generator.execute = execute;
    return [generator valueForKey:@"array"];
}

// KVC for a synthetic array
- (NSUInteger)countOfArray {
    return self.length;
}

- (id)objectInArrayAtIndex:(NSUInteger)index {
    if (self.execute) {
        return self.execute(self.start + index);
    } else {
        NSInteger number = self.start + index * self.step;
        return [NSNumber numberWithInteger:number];
    }
}

@end
