//
//  NSDataTests.m
//  
//
//  Created by 杨俊艺 on 2022/2/16.
//

#import <XCTest/XCTest.h>
@import SkywalkerOC;

@interface NSDataTests : XCTestCase

@end

@implementation NSDataTests

- (void)testExample {
    NSString *str = [NSString stringWithFormat:@"FF"];
    XCTAssertEqual(str.hexData.lowercaseHexString.uppercaseString, [NSString stringWithFormat:@"FF"]);
    XCTAssertEqual(str.hexData.lowercaseHexString, [NSString stringWithFormat:@"ff"]);
    
    XCTAssertEqual(str.hexData.decimalValue, 255);
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        
    }];
}

@end
