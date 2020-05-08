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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
@interface NSSequenceGenerator<__covariant ObjectType> : NSObject

/// Generate a sequence array, element type is NSNumber
/// @param start first number
/// @param length array length
+ (NSArray<NSNumber *> *)generatorWithStart:(NSInteger)start
                                     length:(NSUInteger)length;

/// Generate a sequence array, element type is NSNumber
/// @param start first number
/// @param length array length
/// @param step increase the number of steps
+ (NSArray<NSNumber *> *)generatorWithStart:(NSInteger)start
                                     length:(NSUInteger)length
                                       step:(NSUInteger)step;

/// Generate a sequence array, element type is set generic, default type is `id`,
/// eg. NSSequenceGenerator<NSNumber *> *generator, element type is NSNumber
/// @param start first number
/// @param length array length
/// @param execute next calculation logic for generating elements,
/// `sequence` is the current number of steps, value = index + step, step defaults to 1
+ (NSArray<ObjectType> *)generatorWithStart:(NSInteger)start
                                     length:(NSUInteger)length
                                    execute:(ObjectType(^)(long long sequence))execute;


#pragma mark - unavailable
- (instancetype)init __attribute__((unavailable("use +[NSSequenceGenerator generatorWithStart:length:]")));

@end

NS_ASSUME_NONNULL_END
