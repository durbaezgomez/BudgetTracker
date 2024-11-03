//
//  Font+Ext.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI

extension Font {
    struct Custom {
        public static var headline: Font { .system(size: 20, weight: .semibold).monospaced() }
        
        public static var body10: Font { .system(size: 10, weight: .semibold).monospaced() }
        public static var body12: Font { .system(size: 12, weight: .semibold).monospaced() }
    }
}
