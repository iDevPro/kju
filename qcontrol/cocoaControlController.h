/*
 * QEMU Cocoa Control Controller
 * 
 * Copyright (c) 2005, 2006 Mike Kronenberg
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

#import <Cocoa/Cocoa.h>

#import "cocoaControlDOServer.h"
#import "cocoaControlEditPC.h"
#import "cocoaControlPreferences.h"

@interface cocoaControlController : NSObject
{
	/* preferences */
	NSUserDefaults *userDefaults;
	
	/* distributed object server */
	cocoaControlDOServer *qdoserver;
	
	/* mainMenu */
	IBOutlet id windowMenu;
	
	/* controlWindow */
	NSMutableArray *pcs;
	NSMutableArray *pcsImages;
	NSMutableArray *pcsWindows;
	NSDictionary *cpuTypes;
	NSMutableDictionary *pcsTasks;
	NSMutableDictionary *pcsPIDs;
	NSString *dataPath;
	IBOutlet id mainWindow;
	IBOutlet NSTableView *table;
	
	NSTimer *timer;	 //to update Table Thumbnails
	
	/* progressPanel */
	IBOutlet id progressPanel;
	IBOutlet NSProgressIndicator *progressIndicator;
	IBOutlet NSTextField *progressTitle;
	IBOutlet NSTextField *progressText;
	IBOutlet NSTextField *progressStatusText;
	
	/* editPCPanel */
	cocoaControlEditPC *editPC;
	
	/* preferences */
	cocoaControlPreferences *preferences;
	
	/* newImage */
}
/* init & dealloc */
- (id) init;

/* mainMenu */
- (IBAction)showPreferences:(id)sender;

/* getter & setter */
- (id)pcs;

/* controlWindow */
- (void) loadConfigurations;
- (void) savePCConfiguration:(id)thisPC;
- (void) updateThumbnails;
- (IBAction) addPC:(id)sender;
- (IBAction) deletePC:(id)sender;
- (IBAction) editPC:(id)sender;
- (BOOL) importFreeOSZooPC:(NSString *)name withPath:(NSString *)path;
- (IBAction) importVPC7PC:(id)sender;
- (IBAction) importQemuXPCs:(id)sender;
- (void) startPC:(NSString *)filename;
- (void) tableDoubleClick:(id)sender;

/* editPCPanel */
-(BOOL) checkPC:(NSString *)name create:(BOOL)create;

/* dIWindow */
- (IBAction) openDIWindow:(id)sender;

/* downloadWindow */
- (IBAction)openDownloadWindow:(id)sender;

/* standardAlert */
- (void)standardAlert:(NSString *)messageText informativeText:(NSString *)informativeText;

/* check for update */
- (void)getLatestVersion;
- (void)updateAlertDidEnd:(NSAlert *)alert returnCode:(int)returnCode contextInfo:(void *)contextInfo;
@end