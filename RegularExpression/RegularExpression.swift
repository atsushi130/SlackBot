//
//  RegularExpression.swift
//  SlackBot
//
//  Created by 三宅　篤史 on 2017/01/29.
//
//

import Foundation

struct RegularExpression {
    static func context(text: String) -> Context? {
        for row in Context.enumerate() {
            if let context = text.pregMatche(pattern: row.element) {
                return context
            }
        }
      
        return nil
    }
}
