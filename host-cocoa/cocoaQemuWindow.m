/*
 * QEMU Cocoa QEMU Window
 * 
 * Copyright (c) 2005, 2006 Mike Kronenberg
 *							Pierre d'Herbemont
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "cocoaQemuWindow.h"
#import "cocoaQemu.h"
#import "cocoaQemuOpenGLView.h"
#import "cocoaQemuQuickDrawView.h"
#import "cocoaPopUpView.h"
#import "cocoaCpuView.h"
#import "vl.h"



@implementation cocoaQemuWindow
- (id) initWithSender:(id)sender
{
//	NSLog(@"cocoaQemuWindow: initWithSender");

	if ((self = [super initWithContentRect:NSMakeRect (0, 0, 640, 400)
		//styleMask:NSTitledWindowMask|NSMiniaturizableWindowMask|NSClosableWindowMask|NSUnifiedTitleAndToolbarWindowMask|NSResizableWindowMask //Scrollview
		styleMask:NSTitledWindowMask|NSMiniaturizableWindowMask|NSClosableWindowMask|NSUnifiedTitleAndToolbarWindowMask
		backing:NSBackingStoreBuffered
		defer:YES])) {
	
		pc = sender;
			
		[self setAcceptsMouseMovedEvents:YES];
		[self setReleasedWhenClosed:YES];
		[self setBackgroundColor:[NSColor blackColor]];
		[self center];
		[self setupToolbar];
		[self setDelegate:self];
		[self makeKeyAndOrderFront:nil];
			
		return self;
	}
	return nil;
}

- (void)windowDidResize:(NSNotification *)aNotification
{
//	NSLog(@"cocoaQemuWindow: windowDidResize");

	if ([contentView isKindOfClass:[cocoaQemuQuickDrawView class]]) {
		 /* make the alpha channel opaque so anim won't have holes in it */
		[contentView refreshView];
	}
}

- (void) setupToolbar
{
//	NSLog(@"cocoaQemuWindow: setupToolbar");

	pcWindowToolbar = [[[NSToolbar alloc] initWithIdentifier: @"pcWindowToolbarIdentifier"] autorelease];
	[pcWindowToolbar setAllowsUserCustomization: YES]; //allow customisation
	[pcWindowToolbar setAutosavesConfiguration: YES]; //autosave changes
	[pcWindowToolbar setDisplayMode: NSToolbarDisplayModeIconOnly]; //what is shown
	[pcWindowToolbar setSizeMode:NSToolbarSizeModeSmall]; //default Toolbar Size
	[pcWindowToolbar setDelegate: self]; // We are the delegate
	[self setToolbar: pcWindowToolbar]; // Attach the toolbar to the document window
}

/* Toolbar Delegates*/
- (NSToolbarItem *) toolbar: (NSToolbar *)toolbar itemForItemIdentifier: (NSString *) itemIdent willBeInsertedIntoToolbar:(BOOL) willBeInserted
{
	NSMenu *menu;
	NSMenuItem *menuItem;
	cocoaPopUpView *popUpView;
	NSToolbarItem *toolbarItem = [[[NSToolbarItem alloc] initWithItemIdentifier: itemIdent] autorelease];
	
	if ([itemIdent isEqual: @"fdaChangeIdentifier"]) {
		[toolbarItem setMinSize: NSMakeSize(32,32)];
		[toolbarItem setMaxSize: NSMakeSize(32,32)];
		[toolbarItem setLabel: NSLocalizedStringFromTable(@"toolbar:label:fda", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setPaletteLabel: NSLocalizedStringFromTable(@"toolbar:paletteLabel:fda", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setToolTip: NSLocalizedStringFromTable(@"toolbar:toolTip:fda", @"Localizable", @"cocoaQemuWindow")];

		menu = [[NSMenu alloc] initWithTitle:@"fda"];
		menuItem = [[NSMenuItem alloc] initWithTitle: NSLocalizedStringFromTable(@"toolbar:menuItem:fda:1", @"Localizable", @"cocoaQemuWindow") action:@selector(changeFda:) keyEquivalent:@""];
		[menuItem setTarget:pc];
		[menu addItem:menuItem];
		[menuItem release];		
		[menu addItem:[NSMenuItem separatorItem]];
		menuItem = [[NSMenuItem alloc] initWithTitle: NSLocalizedStringFromTable(@"toolbar:menuItem:fda:2", @"Localizable", @"cocoaQemuWindow") action:@selector(ejectFda:) keyEquivalent:@""];
		[menuItem setTarget:pc];
		[menu addItem:menuItem];
		[menuItem release];

		popUpView = [[cocoaPopUpView alloc] initWithImage:[NSImage imageNamed: @"q_tb_fd.tiff"]];
		[popUpView setMenu:menu];
		[popUpView setToolbarItem:toolbarItem];
		[toolbarItem setView: popUpView];
		[popUpView release];
	} else if([itemIdent isEqual: @"fdbChangeIdentifier"]) {
		[toolbarItem setMinSize: NSMakeSize(32,32)];
		[toolbarItem setMaxSize: NSMakeSize(32,32)];
		[toolbarItem setLabel: NSLocalizedStringFromTable(@"toolbar:label:fdb", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setPaletteLabel: NSLocalizedStringFromTable(@"toolbar:paletteLabel:fdb", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setToolTip: NSLocalizedStringFromTable(@"toolbar:toolTip:fdb", @"Localizable", @"cocoaQemuWindow")];

		menu = [[NSMenu alloc] initWithTitle:@"fdb"];
		menuItem = [[NSMenuItem alloc] initWithTitle: NSLocalizedStringFromTable(@"toolbar:menuItem:fdb:1", @"Localizable", @"cocoaQemuWindow") action:@selector(changeFdb:) keyEquivalent:@""];
		[menuItem setTarget:pc];
		[menu addItem:menuItem];
		[menuItem release];		
		[menu addItem:[NSMenuItem separatorItem]];
		menuItem = [[NSMenuItem alloc] initWithTitle: NSLocalizedStringFromTable(@"toolbar:menuItem:fdb:2", @"Localizable", @"cocoaQemuWindow") action:@selector(ejectFdb:) keyEquivalent:@""];
		[menuItem setTarget:pc];
		[menu addItem:menuItem];
		[menuItem release];

		popUpView = [[cocoaPopUpView alloc] initWithImage:[NSImage imageNamed: @"q_tb_fd.tiff"]];
		[popUpView setMenu:menu];
		[popUpView setToolbarItem:toolbarItem];
		[toolbarItem setView: popUpView];
		[popUpView release];
	} else if([itemIdent isEqual: @"cdromChangeIdentifier"]) {
		[toolbarItem setMinSize: NSMakeSize(32,32)];
		[toolbarItem setMaxSize: NSMakeSize(32,32)];
		[toolbarItem setLabel: NSLocalizedStringFromTable(@"toolbar:label:cdrom", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setPaletteLabel: NSLocalizedStringFromTable(@"toolbar:paletteLabel:cdrom", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setToolTip: NSLocalizedStringFromTable(@"toolbar:toolTip:cdrom", @"Localizable", @"cocoaQemuWindow")];
		
		menu = [[NSMenu alloc] initWithTitle:@"cdrom"];
		menuItem = [[NSMenuItem alloc] initWithTitle: NSLocalizedStringFromTable(@"toolbar:menuItem:cdrom:1", @"Localizable", @"cocoaQemuWindow") action:@selector(useCdrom:) keyEquivalent:@""];
		[menuItem setTarget:pc];
		[menu addItem:menuItem];
		[menuItem release];
		menuItem = [[NSMenuItem alloc] initWithTitle: NSLocalizedStringFromTable(@"toolbar:menuItem:cdrom:2", @"Localizable", @"cocoaQemuWindow") action:@selector(changeCdrom:) keyEquivalent:@""];
		[menuItem setTarget:pc];
		[menu addItem:menuItem];
		[menuItem release];
		[menu addItem:[NSMenuItem separatorItem]];
		menuItem = [[NSMenuItem alloc] initWithTitle: NSLocalizedStringFromTable(@"toolbar:menuItem:cdrom:3", @"Localizable", @"cocoaQemuWindow") action:@selector(ejectCdrom:) keyEquivalent:@""];
		[menuItem setTarget:pc];
		[menu addItem:menuItem];
		[menuItem release];

		popUpView = [[cocoaPopUpView alloc] initWithImage:[NSImage imageNamed: @"q_tb_cdrom.tiff"]];
		[popUpView setMenu:menu];
		[popUpView setToolbarItem:toolbarItem];
		[toolbarItem setView: popUpView];
		[popUpView release];
	} else if([itemIdent isEqual: @"screenshotIdentifier"]) {
		[toolbarItem setLabel: NSLocalizedStringFromTable(@"toolbar:label:screenshot", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setPaletteLabel: NSLocalizedStringFromTable(@"toolbar:paletteLabel:screenshot", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setToolTip: NSLocalizedStringFromTable(@"toolbar:toolTip:screenshot", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setImage: [NSImage imageNamed: @"q_tb_foto.tiff"]];
		[toolbarItem setTarget: pc];
		[toolbarItem setAction: @selector( screenshot )];
	} else if([itemIdent isEqual: @"cpuIdentifier"]) {
		[toolbarItem setMinSize: NSMakeSize(32,32)];
		[toolbarItem setMaxSize: NSMakeSize(32,32)];
		
		cocoaCpuView *cpuView = [[cocoaCpuView alloc] initWithFrame:NSMakeRect(0.,0.,32.,32.)];
		[cpuView setToolbarItem:toolbarItem];
		[toolbarItem setView: cpuView];
		[cpuView release];
		
		[toolbarItem setLabel: NSLocalizedStringFromTable(@"toolbar:label:cpu", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setPaletteLabel: NSLocalizedStringFromTable(@"toolbar:paletteLabel:cpu", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setToolTip: NSLocalizedStringFromTable(@"toolbar:toolTip:cpu", @"Localizable", @"cocoaQemuWindow")];
	} else if([itemIdent isEqual: @"pausePlayIdentifier"]) {
		[toolbarItem setLabel: NSLocalizedStringFromTable(@"toolbar:label:pausePlay", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setPaletteLabel: NSLocalizedStringFromTable(@"toolbar:paletteLabel:pausePlay", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setToolTip: NSLocalizedStringFromTable(@"toolbar:toolTip:pausePlay", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setImage: [NSImage imageNamed: @"q_tb_pause.tiff"]];
		[toolbarItem setTarget: pc];
		[toolbarItem setAction: @selector( pausePlay: )];
	} else if([itemIdent isEqual: @"systemResetIdentifier"]) {
		[toolbarItem setLabel: NSLocalizedStringFromTable(@"toolbar:label:resetPC", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setPaletteLabel: NSLocalizedStringFromTable(@"toolbar:paletteLabel:resetPC", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setToolTip: NSLocalizedStringFromTable(@"toolbar:toolTip:resetPC", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setImage: [NSImage imageNamed: @"q_tb_reset.tiff"]];
		[toolbarItem setTarget: pc];
		[toolbarItem setAction: @selector( resetPC )];
	} else if ([itemIdent isEqual: @"shutdownPCIdentifier"]) {
		[toolbarItem setLabel: NSLocalizedStringFromTable(@"toolbar:label:shutdownPC", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setPaletteLabel: NSLocalizedStringFromTable(@"toolbar:paletteLabel:shutdownPC", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setToolTip: NSLocalizedStringFromTable(@"toolbar:toolTip:shutdownPC", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setImage: [NSImage imageNamed: @"q_tb_shutdown.tiff"]];
		[toolbarItem setTarget: pc];
		[toolbarItem setAction: @selector( shutdownPC )];
	} else if ([itemIdent isEqual: @"ctrlAltDelIdentifier"]) {
		[toolbarItem setLabel: NSLocalizedStringFromTable(@"toolbar:label:ctrlAltDel", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setPaletteLabel: NSLocalizedStringFromTable(@"toolbar:paletteLabel:ctrlAltDel", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setToolTip: NSLocalizedStringFromTable(@"toolbar:toolTip:ctrlAltDel", @"Localizable", @"cocoaQemuWindow")];
		[toolbarItem setImage: [NSImage imageNamed: @"q_tb_ctrlaltdel.tiff"]];
		[toolbarItem setTarget: pc];
		[toolbarItem setAction: @selector( ctrlAltDel: )];
	} else {
		toolbarItem = nil;
	}
	
	return toolbarItem;
}

- (NSArray *) toolbarAllowedItemIdentifiers: (NSToolbar *) toolbar
{
	return [NSArray arrayWithObjects:
		@"fdaChangeIdentifier",
		@"fdbChangeIdentifier",
		@"cdromChangeIdentifier",
		@"systemResetIdentifier",
		@"shutdownPCIdentifier",
		@"screenshotIdentifier",
		@"cpuIdentifier",
		@"pausePlayIdentifier",
		@"ctrlAltDelIdentifier",
		NSToolbarCustomizeToolbarItemIdentifier,
		NSToolbarFlexibleSpaceItemIdentifier,
		NSToolbarSpaceItemIdentifier,
		NSToolbarSeparatorItemIdentifier,
		nil];
}

- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar*)toolbar
{
	return [NSArray arrayWithObjects:
		@"fdaChangeIdentifier",
		@"cdromChangeIdentifier",
		@"screenshotIdentifier",
		NSToolbarSeparatorItemIdentifier,
		@"shutdownPCIdentifier",
		NSToolbarFlexibleSpaceItemIdentifier,
		@"systemResetIdentifier",
		nil];
}

- (BOOL)validateToolbarItem:(NSToolbarItem *)theItem
{
	return YES;
}

- (void)toolbarWillAddItem:(NSNotification *)notification
{
//	NSLog(@"will add item: %@", [[[notification userInfo] objectForKey:@"item"] itemIdentifier]);
	
	if ([[[[notification userInfo] objectForKey:@"item"] itemIdentifier] isEqual:@"cpuIdentifier"]) {
				cpuTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:[[[notification userInfo] objectForKey:@"item"] view] selector:@selector( updateToolbarItem ) userInfo:nil repeats:YES];
	}
}

- (void)toolbarDidRemoveItem:(NSNotification *)notification
{
//	NSLog(@"did remove item: %@", [[[notification userInfo] objectForKey:@"item"] itemIdentifier]);
	
	if ([[[[notification userInfo] objectForKey:@"item"] itemIdentifier] isEqual:@"cpuIdentifier"]) {
		[cpuTimer invalidate];
	}
}

- (void) setMyContentView:(id)aContentView
{
	contentView = aContentView;
}

- (void) windowWillMiniaturize:(NSNotification *)aNotification
{
//	NSLog(@"cocoaQemuWindow: windowWillMiniaturize");

	/* OS X cant display openGL canvas during miniturize, so we draw it to a NSImageView */
	if ([contentView isKindOfClass:[cocoaQemuOpenGLView class]]) {
		imageView = [[NSImageView alloc] initWithFrame: [[self contentView] frame]];
		[imageView setImage: [contentView screenshot:NSMakeSize(0,0)]];
		[[self contentView] addSubview:imageView];
		[imageView display];	
	
		/* now we hide the contentView */
		[contentView setHidden:YES];
	}
}

- (void)miniaturize:(id)sender
{
//	NSLog(@"cocoaQemuWindow: miniaturize");

	if ([contentView isKindOfClass:[cocoaQemuQuickDrawView class]]) {
		 /* make the alpha channel opaque so anim won't have holes in it */
		[contentView refreshView];
	}
	
	[super miniaturize:sender];
}

- (void)display
{
//	NSLog(@"cocoaQemuWindow: display");

	if ([contentView isKindOfClass:[cocoaQemuQuickDrawView class]]) {
		/* make sure pixels are fully opaque */
		[contentView refreshView];
		
		/* save current visible SDL surface */
		[self cacheImageInRect:[contentView frame]];
		
		/* let the window manager redraw controls, border, etc */
		[super display];
		
		/* restore visible SDL surface */
		[self restoreCachedImage];
	} else {
		[super display];
	}
}

- (void) windowDidDeminiaturize:(NSNotification *)aNotification
{
//	NSLog(@"cocoaQemuWindow: windowDidDeminiaturize");

	if ([contentView isKindOfClass:[cocoaQemuOpenGLView class]]) {
		/* refresh openGLView */
		[contentView display];
		
		/* show contentView */
		[contentView setHidden:NO];
		
		/* get rid of NSImageView */
		[imageView removeFromSuperview];
	}
}

- (void) windowDidBecomeKey:(NSNotification *)aNotification
{
//	NSLog(@"cocoaQemuWindow: windowDidBecomeKey");

	/* start WM if required */
	if ([pc wMStopWhenInactive] && ![pc wMPausedByUser])
		[pc startVM];
}

- (void) windowDidResignKey:(NSNotification *)aNotification
{
//	NSLog(@"cocoaQemuWindow: windowDidResignKey");

	/* ungrab Mouse */
	[pc ungrabMouse];
		[NSCursor unhide];
	[pc setTablet_enabled:0];
	
	/* reset Key Modifiers */
	[pc resetModifiers];

	/* disable Tablet */
	if ([pc tablet_enabled]) {
	
	}

	/* stop WM if required */
	if ([pc wMStopWhenInactive])
		[pc stopVM];
}

- (BOOL) windowShouldClose:(id)sender
{
//	NSLog(@"cocoaQemuWindow: windowShouldClose");

	[pc shutdownPC];
	return NO;
}


@end
