//
//  IGTextFieldModifier.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/1/24.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
