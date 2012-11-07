/*
 * Copyright (c) 2010 WiYun Inc.
 * Author: luma(stubma@gmail.com)
 *
 * For all entities this program is free software; you can redistribute
 * it and/or modify it under the terms of the 'WiEngine' license with
 * the additional provision that 'WiEngine' must be credited in a manner
 * that can be be observed by end users, for example, in the credits or during
 * start up. (please find WiEngine logo in sdk's logo folder)
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
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#import "GLViewController.h"
#include "wyDirector.h"
#import "WYOpenGLView.h"
	
// global screen config, only available for mac os x or windows
extern wyScreenConfig gScreenConfig;

@implementation GLViewController 

@synthesize appDelegate = m_appDelegate;

- (id)initWithDemoEntry:(demoEntryFunc)func {
	self = [super init];
	if(self) {
		m_func = func;
		
		// create opengl view
		WYOpenGLView* glView = [[[WYOpenGLView alloc] initWithFrame:NSMakeRect(0, 0, gScreenConfig.winWidth, gScreenConfig.winHeight)] autorelease];
		self.view = glView;
		
		/*
		 * If you want to run demo in base size mode, uncomment
		 * following code
		 */
//		wyDirector* director = wyDirector::getInstance();
//		director->setScaleMode(SCALE_MODE_BASE_SIZE_FIT_XY);
//		director->setBaseSize(320, 480);
        
        // execute demo entry
        m_func();
	}
	return self;
}

- (void)dealloc {
	WYOpenGLView* glView = (WYOpenGLView*)self.view;
	[glView stopRender];
	[glView.window makeFirstResponder:nil];
	[self.view removeFromSuperview];
    [super dealloc];
}

@end
