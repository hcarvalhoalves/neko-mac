/* NekoView */

#import <Cocoa/Cocoa.h>

@interface NekoView : NSView
{
	NSImage *image;
}

- (NSImage*)image;
- (void)setImageTo:(NSImage*)theImage;

@end
