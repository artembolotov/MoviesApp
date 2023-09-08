//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by artembolotov on 08.09.2023.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
