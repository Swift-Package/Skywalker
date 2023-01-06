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
    NSString *strFF = [NSString stringWithFormat:@"FF"];
    XCTAssertEqual(strFF.hexData.lowercaseHexString, [NSString stringWithFormat:@"ff"]);
    XCTAssertEqual(strFF.hexData.decimalValue, 255);
    
    NSString *str100 = [NSString stringWithFormat:@"00000064"];
    XCTAssertEqual(str100.hexData.lowercaseHexString, [NSString stringWithFormat:@"00000064"]);
    XCTAssertEqual(str100.hexData.lowercaseHexString.uppercaseString, [NSString stringWithFormat:@"00000064"]);
    XCTAssertEqual(str100.hexData.decimalValue, 100);
    
    NSString *str99 = [NSString stringWithFormat:@"63"];
    XCTAssertEqual(str99.hexData.decimalValue, 99);
    XCTAssertEqual(str99.hexData.lowercaseHexString, [NSString stringWithFormat:@"63"]);
    XCTAssertEqual(str99.hexData.lowercaseHexString.uppercaseString, [NSString stringWithFormat:@"63"]);
    
    
    NSString *str = [NSString stringWithFormat:@"1FFFFAB"];
    XCTAssertEqual(str.hexData.decimalValue, 33554347);
    XCTAssertEqual(str.hexData.lowercaseHexString, [NSString stringWithFormat:@"01ffffab"]);
    XCTAssertEqual(str.hexData.lowercaseHexString.uppercaseString, [NSString stringWithFormat:@"01FFFFAB"]);
}

@end
