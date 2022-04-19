//
//  NSStringTests.m
//  
//
//  Created by 杨俊艺 on 2022/2/16.
//

#import <XCTest/XCTest.h>
@import SkywalkerOC;

@interface NSStringTests : XCTestCase

@end

@implementation NSStringTests

- (void)testExample {
    NSString *str = [NSString stringWithFormat:@"FF"];
    XCTAssertEqual(str.hexData.decimalValue, 255);
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        
    }];
}

@end
