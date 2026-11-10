//
//  main.m
//  猫
//
//  Created by Matthew Donoughe on 2007-09-23.
//  Copyright __MyCompanyName__ 2007. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NekoPanel.h"

int main(int argc, char *argv[])
{
	@autoreleasepool {
		NSApplication *app = [NSApplication sharedApplication];
		NekoPanel *panel = [[NekoPanel alloc] initWithContentRect:NSMakeRect(0.0f, 0.0f, 32.0f, 32.0f)
		                                                styleMask:NSWindowStyleMaskBorderless
		                                                  backing:NSBackingStoreBuffered
		                                                    defer:NO];
		[panel orderFrontRegardless];
		[app run];
	}
	return 0;
}
