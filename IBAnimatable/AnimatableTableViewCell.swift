//
//  Created by Jake Lin on 12/16/15.
//  Copyright © 2015 IBAnimatable. All rights reserved.
//

import UIKit

@IBDesignable open class AnimatableTableViewCell: UITableViewCell, FillDesignable, BorderDesignable, TableViewCellDesignable, GradientDesignable, Animatable {
  
  // MARK: - FillDesignable
  @IBInspectable open var fillColor: UIColor? {
    didSet {
      configureFillColor()
    }
  }
  
  open var predefinedColor: ColorType? {
    didSet {
      configureFillColor()
    }
  }
  @IBInspectable var _predefinedColor: String? {
    didSet {
      predefinedColor = ColorType(string: _predefinedColor)
    }
  }
  
  @IBInspectable open var opacity: CGFloat = CGFloat.nan {
    didSet {
      configureOpacity()
    }
  }

  // MARK: - BorderDesignable
  @IBInspectable open var borderColor: UIColor? {
    didSet {
      configureBorder()
    }
  }
  
  @IBInspectable open var borderWidth: CGFloat = CGFloat.nan {
    didSet {
      configureBorder()
    }
  }
  
  open var borderSides: BorderSides  = .AllSides {
    didSet {
      configureBorder()
    }
  }
  
  @IBInspectable var _borderSides: String? {
    didSet {
      borderSides = BorderSides(rawValue: _borderSides)
    }
  }  
  // MARK: - TableViewCellDesignable
  @IBInspectable open var removeSeparatorMargins: Bool = false
  
  // MARK: - GradientDesignable
  @IBInspectable open var startColor: UIColor?
  @IBInspectable open var endColor: UIColor?
  open var predefinedGradient: GradientType?
  @IBInspectable var _predefinedGradient: String? {
    didSet {
      predefinedGradient = GradientType(string: _predefinedGradient)
    }
  }
open var startPoint: GradientStartPoint = .top
  @IBInspectable var _startPoint: String? {
    didSet {
      startPoint = GradientStartPoint(string: _startPoint, default: .top)
    }
  }
  
  // MARK: - Animatable
  open var animationType: AnimationType = .none
  @IBInspectable  var _animationType: String? {
    didSet {
     animationType = AnimationType(string: _animationType)
    }
  }
  @IBInspectable open var autoRun: Bool = true
  @IBInspectable open var duration: Double = Double.nan
  @IBInspectable open var delay: Double = Double.nan
  @IBInspectable open var damping: CGFloat = CGFloat.nan
  @IBInspectable open var velocity: CGFloat = CGFloat.nan
  @IBInspectable open var force: CGFloat = CGFloat.nan
  
  // MARK: - Lifecycle
  open override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    configureInspectableProperties()
  }
  
  open override func awakeFromNib() {
    super.awakeFromNib()
    configureInspectableProperties()
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    configureAfterLayoutSubviews()
    autoRunAnimation()
  }
  
  // MARK: - Private
  fileprivate func configureInspectableProperties() {
    configureAnimatableProperties()
    configureOpacity()
    configureSeparatorMargins()
  }
  
  fileprivate func configureAfterLayoutSubviews() {
    configureBorder()
    configureGradient()
  }
}
