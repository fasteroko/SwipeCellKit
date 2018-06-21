//
//  Options.swift
//
//  Created by Jeremy Koch.
//  Copyright © 2017 Jeremy Koch. All rights reserved.
//

import UIKit

/// :nodoc:
public typealias SwipeTableOptions = SwipeOptions

/// The `SwipeOptions` class provides options for transistion and expansion behavior for swiped cell.
public class SwipeOptions: NSObject {
    /// The transition style. Transition is the style of how the action buttons are exposed during the swipe.
    @objc public var transitionStyle: SwipeTransitionStyle = .border
    
    /// The expansion style. Expansion is the behavior when the cell is swiped past a defined threshold.
    public var expansionStyle: SwipeExpansionStyle?
    
    /// The object that is notified when expansion changes.
    ///
    /// - note: If an `expansionDelegate` is not provided, and the expanding action is configured with a clear background, the system automatically uses the default `ScaleAndAlphaExpansion` to show/hide underlying actions.
    public var expansionDelegate: SwipeExpanding?
    
    /// The background color behind the action buttons.
    @objc public var backgroundColor: UIColor?
    
    /// The largest allowable button width.
    ///
    /// - note: By default, the value is set to the table/collection view divided by the number of action buttons minus some additional padding. If the value is set to 0, then word wrapping will not occur and the buttons will grow as large as needed to fit the entire title/image.
    @objc public var maximumButtonWidth: CGFloat = 0
    
    /// The smallest allowable button width.
    ///
    /// - note: By default, the system chooses an appropriate size.
    @objc public var minimumButtonWidth: CGFloat = 0
    
    /// The vertical alignment mode used for when a button image and title are present.
    @objc public var buttonVerticalAlignment: SwipeVerticalAlignment = .centerFirstBaseline
    
    /// The amount of space, in points, between the border and the button image or title.
    @objc public var buttonPadding: CGFloat = 8
    
    /// The amount of space, in points, between the button image and the button title.
    @objc public var buttonSpacing: CGFloat = 8
}

/// Describes the transition style. Transition is the style of how the action buttons are exposed during the swipe.
@objc public enum SwipeTransitionStyle: Int {
    /// The visible action area is equally divide between all action buttons.
    case border
    
    /// The visible action area is dragged, pinned to the cell, with each action button fully sized as it is exposed.
    case drag
    
    /// The visible action area sits behind the cell, pinned to the edge of the table/collection view, and is revealed as the cell is dragged aside.
    case reveal
}

/// Describes which side of the cell that the action buttons will be displayed.
@objc public enum SwipeActionsOrientation: Int {
    
    /// The left side of the cell.
    case left
    
    /// The right side of the cell.
    case right
    
    var scale: CGFloat {
        return rawValue
    }
}

/// RawRepresentable extension for SwipeActionsOrientation enum to provite backward compatibility for objective-c language.
extension SwipeActionsOrientation: RawRepresentable {
    public typealias RawValue = CGFloat
    
    public init?(rawValue: RawValue) {
        switch rawValue {
        case -1: self = .left
        case 1: self = .right
        default: return nil
        }
    }
    
    public var rawValue: RawValue {
        switch self {
        case .left: return -1
        case .right: return 1
        }
    }
}

/// Describes the alignment mode used when action button images and titles are provided.
@objc public enum SwipeVerticalAlignment: Int {
    /// All actions will be inspected and the tallest image and first baseline offset of title text will be used to create the alignment rectangle.
    ///
    /// - note: This mode will ensure the image and first line of each button title and consistently aligned across the swipe view.
    case centerFirstBaseline
    
    /// The action button image height and full title height are used to create the aligment rectange.
    ///
    /// - note: Buttons with varying number of lines will not be consistently aligned across the swipe view.
    case center
}
