import PackageDescription

let package = Package(
    name: "SlackBot",
    dependencies: [
        .Package(url: "https://github.com/pvzig/SlackKit.git", majorVersion: 3)
    ]
)
