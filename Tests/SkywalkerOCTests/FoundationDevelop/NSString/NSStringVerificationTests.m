//
//  NSStringVerificationTests.m
//  
//
//  Created by 杨俊艺 on 2022/4/12.
//

#import <XCTest/XCTest.h>
@import SkywalkerOC;

@interface NSStringVerificationTests : XCTestCase

@end

@implementation NSStringVerificationTests

- (void)setUp {
    
}

- (void)tearDown {
    
}

- (void)testExample {
    XCTAssertEqual(@"".isBlank, YES);
    XCTAssertEqual(@" ".isBlank, YES);
    XCTAssertEqual(@"  ".isBlank, YES);
    XCTAssertEqual(@" \n\n ".isBlank, YES);
    XCTAssertEqual(@" c ".isBlank, NO);
}

@end
