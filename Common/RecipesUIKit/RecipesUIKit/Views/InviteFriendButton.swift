//
//  InviteFriendButton.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

open class InviteFriendButton: UIButton {
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let icon = UIImage(named: "icon-add-user", in: Bundle.UI, compatibleWith: nil)
        setImage(icon, for: .normal)
        
        setBackgroundImage(imageWithColor(Colors.primary), for: .normal)
        setBackgroundImage(imageWithColor(Colors.primaryDark), for: .highlighted)
    }
    
}
