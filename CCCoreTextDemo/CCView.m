//
//  CCView.m
//  CCCoreTextDemo
//
//  Created by CC on 2020/12/29.
//  Copyright © 2020 - now youhua deng (deng you hua | CC) <ccworld1000@gmail.com>. All rights reserved.
//

#import "CCView.h"
#import <CoreText/CoreText.h>

@implementation CCView

- (void)drawCC {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1, -1);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    NSDictionary *attributes = @{
        NSFontAttributeName: [UIFont systemFontOfSize:18],
        NSForegroundColorAttributeName: [UIColor blueColor]
    };
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString: @"123CCC Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world 123ccc"  attributes:attributes];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attrStr);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrStr.length), path, NULL);
    CTFrameDraw(frame, context);
}

- (void)drawCC1 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    NSDictionary *attributes = @{
        NSFontAttributeName: [UIFont systemFontOfSize:18],
        NSForegroundColorAttributeName: [UIColor blueColor]
    };
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString: @"123CCC Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world 123ccc"  attributes:attributes];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attrStr);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrStr.length), path, NULL);
    CTFrameDraw(frame, context);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self drawCC];
}

@end
