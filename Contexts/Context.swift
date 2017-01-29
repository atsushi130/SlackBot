//
//  Context.swift
//  SlackBot
//
//  Created by 三宅　篤史 on 2017/01/28.
//
//

import Foundation
import SlackKit

enum Context: String, Enumerable {
    case sumanu  = "すまぬ"
    case doya    = "ドヤァ"
    
    func send(client: Client, channel: String) {
        switch self {
        case .sumanu:  self.send(client: client, channel: channel, text: "ええんやで")
        case .doya:    self.send(client: client, channel: channel, text: "やるやん")
        }
    }
    
    private func send(client: Client, channel: String, text: String) {
        client.webAPI.sendMessage(channel: channel, text: text, asUser: true, success: nil, failure: nil)
    }
}
