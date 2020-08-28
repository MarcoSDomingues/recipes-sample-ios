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
        
        setBackgroundImage(imageWithColor(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), for: .normal)
        setBackgroundImage(imageWithColor(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)), for: .highlighted)
    }
    
}
