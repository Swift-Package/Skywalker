//
//  UIImageTests.m
//  
//
//  Created by 杨俊艺 on 2022/2/16.
//

#import <XCTest/XCTest.h>
@import SkywalkerOC;

@interface UIImageTests : XCTestCase

@end

@implementation UIImageTests

- (void)setUp {
    
}

- (void)tearDown {
    
}

- (void)testExample {
    UIImage *i = [UIImage systemImageNamed:@"cc"];
    [i convertToGrayImage];
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        
    }];
}

@end
