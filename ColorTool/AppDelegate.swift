//
//  AppDelegate.swift
//  ColorTool
//
//  Created by wenyou on 2017/6/24.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    static let windowSize = NSMakeSize(800, 600)
    var window: NSWindow!
    let a: String = ""

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(contentRect: .zero, styleMask: [.closable, .resizable, .miniaturizable, .titled], backing: .buffered, defer: false)
        window.minSize = NSMakeSize(AppDelegate.windowSize.width, AppDelegate.windowSize.height + 22) // 22 是标题栏的高度
        window.contentViewController = ViewController()
        window.title = "Color Tool"

        window.center()
        window.makeKeyAndOrderFront(self)
    }
}
