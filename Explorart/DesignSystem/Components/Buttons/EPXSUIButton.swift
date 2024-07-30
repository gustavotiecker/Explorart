//
//  EPXSUIButton.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 30/07/24.
//

import SwiftUI

struct EPXSUIButton: View {
    var action: () -> Void
    var title: String

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.accent)
                .cornerRadius(10)
        }
        .padding([.leading, .trailing], 16)
    }
}


#Preview {
    EPXSUIButton(action: {}, title: "EPX SwiftUI Button")
}
