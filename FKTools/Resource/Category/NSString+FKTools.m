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

#import "NSString+FKTools.h"

@implementation NSString (Repeater)

- (NSString *)repeatTimes:(NSUInteger)times separate:(NSString *)separate {
    @autoreleasepool {
        NSUInteger index = (self.length * times + separate.length * times) - separate.length;
        NSString *unit = [NSString stringWithFormat:@"%@%@", self, separate];
        return [[unit stringByPaddingToLength:times * unit.length withString:unit startingAtIndex:0] substringToIndex:index];
    }
}

- (NSString *)repeatTimes:(NSUInteger)times {
  return [self repeatTimes:times separate:@""];
}

@end

@implementation NSString (Formatter)

+ (NSString *)stringFromByteCount:(long long)count countStyle:(NSByteCountFormatterCountStyle)countStyle {
    if (count == 0) { return @"0 KB"; }
    return [NSByteCountFormatter stringFromByteCount:count countStyle:countStyle];
}

@end
