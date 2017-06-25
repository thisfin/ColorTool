//
//  Application.swift
//  ColorTool
//
//  Created by wenyou on 2017/6/24.
//  Copyright © 2017年 wenyou. All rights reserved.
//

import AppKit

class Application: NSApplication { // 注册到info.plist
    let appDelegate = AppDelegate()

    override init() {
        super.init()
        self.delegate = appDelegate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
