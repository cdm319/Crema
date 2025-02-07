//
//  AddCoffeeView.swift
//  Crema
//
//  Created by Chris Matthews on 07/02/2025.
//

import SwiftUI
import SwiftData

struct AddCoffeeView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var coffee : Coffee = Coffee(roaster: "", name: "")
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Roaster", text: $coffee.roaster)
                TextField("Coffee", text: $coffee.name)
            }
            
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }) {
                        Label("Dismiss", systemImage: "xmark.circle.fill")
                            .foregroundStyle(.tertiary)
                            .font(.system(size: 20))
                            .opacity(0.8)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                ToolbarItem {
                    Button("Save") {
                        addCoffee()
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .font(.system(size: 14))
                }
            }
        }
    }
    
    private func addCoffee() {
        modelContext.insert(coffee)
        dismiss()
    }
}

#Preview {
    AddCoffeeView()
}
