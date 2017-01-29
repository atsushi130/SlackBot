import Foundation
import SlackKit

class SlackBot: MessageEventsDelegate {
    
    let bot: SlackKit
    
    init(token: String) {
        bot = SlackKit(withAPIToken: token)
        bot.onClientInitalization = { (client: Client) in
            client.messageEventsDelegate = self
        }
    }
    
    func received(_ message: Message, client: Client) {
        guard let text = message.text, let channel = message.channel else { return }
        
        if let context = RegularExpression.context(text: text) {
            context.send(client: client, channel: channel)
        }
    }
    
    func sent(_ message: Message, client: Client)     {}
    func changed(_ message: Message, client: Client)  {}
    func deleted(_ message: Message?, client: Client) {}
}

let slackBot = SlackBot(token: "")
RunLoop.main.run()
