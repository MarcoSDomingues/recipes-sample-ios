//
//  Framework+Bundle.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

internal extension Bundle {
    
    private class _Bundle {}
    static var UI: Bundle { return Bundle(for: _Bundle.self) }
    
}
