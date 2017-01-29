//
//  Enumerable.swift
//  SlackBot
//
//  Created by 三宅　篤史 on 2017/01/29.
//
//

import Foundation

protocol Enumerable {
    associatedtype Case = Self
}

extension Enumerable where Case: Hashable {
    private static var iterator: AnyIterator<Case> {
        var n = 0
        return AnyIterator {
            defer { n += 1 }
            
            let next = withUnsafePointer(to: &n) {
                UnsafeRawPointer($0).assumingMemoryBound(to: Case.self).pointee
            }
            return next.hashValue == n ? next : nil
        }
    }
    
    static func enumerate() -> EnumeratedSequence<AnySequence<Case>> {
        return AnySequence(self.iterator).enumerated()
    }
    
    static var cases: [Case] {
        return Array(self.iterator)
    }
    
    static var count: Int {
        return self.cases.count
    }
}
