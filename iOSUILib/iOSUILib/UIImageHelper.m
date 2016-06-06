//
//  UIImageHelper.m
//  Pods
//
//  Created by Aron Springfield on 06/06/2016.
//
//

#import "UIImageHelper.h"

@implementation UIImage (MaterialControls)

- (UIImage *)imageWithTintColour:(UIColor *)colour
{
    // lets tint the icon - assumes your icons are solid colour
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // draw alpha-mask
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextDrawImage(context, rect, self.CGImage);
    
    // draw tint color, preserving alpha values of original image
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    [colour setFill];
    CGContextFillRect(context, rect);
    
    UIImage *colouredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return colouredImage;
}

@end
