//
//  CollapseViewTransition.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var movieElementTransition: AnyTransition {
        let insertion = AnyTransition
            .move(edge: .top)
            .combined(with: .opacity)
            .combined(with: .scale)
        
        let removal = AnyTransition
            .move(edge: .top)
            .combined(with: .opacity)
            .combined(with: .scale)
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

extension Animation {
    static var bigViewSpringAnimation: Animation {
        return .interpolatingSpring(mass: 2, stiffness: 100, damping: 20, initialVelocity: 0)
    }
    
    static func slideInOut(for state: Bool) -> Animation {
        return .interpolatingSpring(mass: 1, stiffness: 100, damping: state ? 10 : 100, initialVelocity: 0)
    }
}
