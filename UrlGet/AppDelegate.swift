import UIKit
import Foundation
import GRPC

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let window = UIWindow()
        let rootController = UIViewController()
        rootController.view.backgroundColor = .blue
        rootController.title = "Hello"
        
        window.rootViewController = UINavigationController(rootViewController: rootController)
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

public struct CheckableStruct {
    public init() {}
    public func returnTrue() -> Bool {
        true
    }
    public func returnFalse() -> Bool {
        false
    }
}
