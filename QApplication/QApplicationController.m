/*
 * Q Application Controller
 * 
 * Copyright (c) 2007 - 2008 Mike Kronenberg
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

#import "QApplicationController.h"


@implementation QApplicationController
{
	int uniqueDocumentID;
}
@synthesize userDefaults;
- (instancetype) init
{
	Q_DEBUG(@"init");

    self = [super init];
    if (self) {

		// preferences
		[[NSUserDefaults standardUserDefaults] registerDefaults:@{@"enableLogToConsole": @NO, // disable log to console
			@"yellow": @YES, // yellow
			@"showFullscreenWarning": @YES, // showFullscreenWarning
			@"knownVMs": [NSMutableArray array]}]; // known VMs
		userDefaults = [NSUserDefaults standardUserDefaults];

		// remove obsolete entries form old preferences
		if ([userDefaults objectForKey:@"enableOpenGL"]) {
			[userDefaults removeObjectForKey:@"enableOpenGL"];
		}
		if ([userDefaults objectForKey:@"display"]) {
			[userDefaults removeObjectForKey:@"display"];
		}
		if ([userDefaults objectForKey:@"enableCheckForUpdates"]) {
			[userDefaults removeObjectForKey:@"enableCheckForUpdates"];
		}
		if ([userDefaults objectForKey:@"dataPath"]) {
			[userDefaults removeObjectForKey:@"dataPath"];
		}
		// TODO:Sparclekey for userdefaults
		
		// add necessary entries to old preferences
		NSFileManager *fileManager = [NSFileManager defaultManager];
		if (![userDefaults objectForKey:@"dataPath"]) {
			NSURL *docURL = [[fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil] URLByAppendingPathComponent:@"QEMU" isDirectory:YES];
			[userDefaults setObject:docURL.path forKey:@"dataPath"];
		}

        // create PC directory
        if ([fileManager fileExistsAtPath: [NSString stringWithFormat:@"%@/", [userDefaults objectForKey:@"dataPath"]]] == NO)
			[fileManager createDirectoryAtPath:[userDefaults objectForKey:@"dataPath"] withIntermediateDirectories:YES attributes:nil error:nil];
		
		// uniqueDocumentIDs
		uniqueDocumentID = 7;
        }
	
    return self;
}

#pragma mark overriding NSDocumentController & NSApp Methods
- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
	Q_DEBUG(@"applicationShouldOpenUntitledFile");

    // we want no untitled doc
    return NO;
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
	[userDefaults synchronize];
	[[NSDocumentController sharedDocumentController] closeAllDocumentsWithDelegate:self didCloseAllSelector:@selector(documentController:didCloseAll:contextInfo:) contextInfo:nil];

	return NSTerminateLater;
}

- (IBAction) openDocument:(id)sender
{
	Q_DEBUG(@"applicationShouldOpenUntitledFile");
    
    //myDoc
	NSOpenPanel *panel = [NSOpenPanel openPanel];
	panel.allowedFileTypes = @[@"qvm", @"ch.kberg.Q.vm"];
	panel.directoryURL = [NSURL fileURLWithPath:[userDefaults objectForKey:@"pcData"]];
	[panel beginWithCompletionHandler:^(NSInteger returnCode) {
		Q_DEBUG(@"openPanelDidEnd");
		
		if (returnCode == NSOKButton) {
			NSURL *path;
			NSDocumentController *documentController;
			NSDocument *document;
			
			//path = [NSURL URLWithString:[[panel filenames] objectAtIndex:0]];
			if (panel.URLs.count < 1) {
				return;
			}
			path = panel.URLs[0];
			documentController = [NSDocumentController sharedDocumentController];
			
			// is this document already open?
			if ([documentController documentForURL:path]) {
				NSLog(@"Document is already open");
				//Todo: show the document
			} else {
				
				// open the document
				document = [documentController makeDocumentWithContentsOfURL:path ofType:@"QVM" error:nil];
				if (document) {
					[documentController addDocument:document];
					[document makeWindowControllers];
					[document showWindows];
				} else {
					NSLog(@"Document was not created");
				}
			}
		}
	}];
}

- (void)documentController:(NSDocumentController *)docController didCloseAll: (BOOL)didCloseAll contextInfo:(void *)contextInfo
{
	Q_DEBUG(@"QApplicationController: documentController: didCloseAll");

	[NSApp replyToApplicationShouldTerminate:YES];
}


-(int) leaseAUniqueDocumentID:(id)sender
{
	Q_DEBUG(@"leaseAUniqueDocumentID");

    uniqueDocumentID++;
    
    return uniqueDocumentID;
}

@end
