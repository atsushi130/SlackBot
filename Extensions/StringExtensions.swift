//
//  StringExtensions.swift
//  SlackBot
//
//  Created by 三宅　篤史 on 2017/01/29.
//
//

import Foundation

extension String {
    
    var count: Int {
        let string_NS = self as NSString
        return string_NS.length
    }
    
    //正規表現検索
    func pregMatche(pattern: Context, options: NSRegularExpression.Options = []) -> Context? {
        guard let regex = try? NSRegularExpression(pattern: pattern.rawValue, options: options) else {
            return nil
        }
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.count > 0 ? pattern : nil
    }
}
