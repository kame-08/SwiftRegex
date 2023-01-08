//
//  main.swift
//  CommandLine
//
//  Created by Ryo on 2023/01/07.
//

import Foundation
import RegexBuilder

let regex = Regex {
    "!["
    Capture {
        ZeroOrMore(.any)
    }
    "]("
    Capture {
        ZeroOrMore(.any)
        // 下の2つだと取得できない
        // "![text](https://developer.apple.com)" の最後の)を消すと正しく取得できる
        // ZeroOrMore(.url(), .eager)
        // .url()
    }
    ")"
}

if let match = "![text](https://developer.apple.com)".wholeMatch(of: regex) {
    print("正しい")
    print(match.1) // text
    print(match.2) // https://developer.apple.com
} else {
    print("間違っている")
}

