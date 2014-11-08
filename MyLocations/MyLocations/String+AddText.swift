//
//  String+AddText.swift
//  MyLocations
//
//  Created by yaming on 11/7/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

extension String {
    mutating func addText(text: String?, withSeparator separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
