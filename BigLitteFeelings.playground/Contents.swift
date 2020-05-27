import PlaygroundSupport
import SwiftUI

/// # Big Litte Feelings
/// > created by Witek Bobrowski.
///
/// Welcome to my Swift Student Challenge Submission!
/// Everything is prepared and ready to go!

/// There are two ways to create new account.
/// You can either setup it in the app, of you can create it here
let user = User(name: "Witek", avatar: "👨🏻‍💻")

/// You can pass `nil` here to discard  a user created above
let app = BigLitteFeelings(user: user)
let window = UIWindow(
    frame: CGRect(x: 0, y: 0, width: 760, height: 960)
)
window.rootViewController = app
window.makeKeyAndVisible()

/// All that is left to do is to launch the app. Enjoy :)
PlaygroundPage.current.setLiveView(app.view)
