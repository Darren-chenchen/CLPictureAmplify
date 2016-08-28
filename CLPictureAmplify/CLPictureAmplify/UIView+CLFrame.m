
//

#import "UIView+CLFrame.h"

@implementation UIView (CLFrame)
- (void)setCl_x:(CGFloat)cl_x
{
    CGRect frame = self.frame;
    frame.origin.x = cl_x;
    self.frame = frame;
}

- (CGFloat)cl_x
{
    return self.frame.origin.x;
}

- (void)setCl_y:(CGFloat)cl_y
{
    CGRect frame = self.frame;
    frame.origin.y = cl_y;
    self.frame = frame;
}

- (CGFloat)cl_y
{
    return self.frame.origin.y;
}

- (void)setCl_w:(CGFloat)cl_w
{
    CGRect frame = self.frame;
    frame.size.width = cl_w;
    self.frame = frame;
}

- (CGFloat)cl_w
{
    return self.frame.size.width;
}

- (void)setCl_h:(CGFloat)cl_h
{
    CGRect frame = self.frame;
    frame.size.height = cl_h;
    self.frame = frame;
}

- (CGFloat)cl_h
{
    return self.frame.size.height;
}

- (void)setCl_size:(CGSize)cl_size
{
    CGRect frame = self.frame;
    frame.size = cl_size;
    self.frame = frame;
}

- (CGSize)cl_size
{
    return self.frame.size;
}

- (void)setCl_origin:(CGPoint)cl_origin
{
    CGRect frame = self.frame;
    frame.origin = cl_origin;
    self.frame = frame;
}

- (CGPoint)cl_origin
{
    return self.frame.origin;
}
@end
