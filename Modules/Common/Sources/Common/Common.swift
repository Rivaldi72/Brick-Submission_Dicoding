import UIKit

public func CommonImage(named name: String) -> UIImage? {
    UIImage(named: name, in: Bundle.module, compatibleWith: nil)
}

public extension UIColor {
    
    static let darkGrayColor = UIColor(named: "dark_gray_color", in: Bundle.module, compatibleWith: nil)
    static let grayColor = UIColor(named: "gray_color", in: Bundle.module, compatibleWith: nil)
    static let redColor = UIColor(named: "red_color", in: Bundle.module, compatibleWith: nil)
    static let whiteColor = UIColor(named: "white_color", in: Bundle.module, compatibleWith: nil)
    static let inactiveStarColor = UIColor(named: "inactive_star", in: Bundle.module, compatibleWith: nil)
}
