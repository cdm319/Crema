//
//  CoffeeListCell.swift
//  Crema
//
//  Created by Chris Matthews on 06/02/2025.
//

import SwiftUI

struct CoffeeListCell : View {
    var coffee : Coffee
    
    var body : some View {
        ZStack(alignment: .leading) {
            HStack {
                Image("PlaceholderCoffee")
                    .resizable()
                    .scaledToFill()
                    .containerRelativeFrame(.horizontal) { size, axis in
                        size * 0.2
                    }
                
                VStack(alignment: .leading) {
                    Text("\(coffee.roaster)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    Text("\(coffee.name)")
                }
                .padding(.horizontal, 16)
                
                Spacer()
                
                Gauge(value: coffee.rating, in: 0...10) {}
                currentValueLabel: {
                    Text("\(String(format: "%.1f", coffee.rating))")
                }
                .gaugeStyle(.accessoryCircular)
                .tint(Gradient(colors: [.red, .yellow, .green]))
                .scaleEffect(0.7)
            }
            
            NavigationLink {
                CoffeeView(coffee: coffee)
            } label: {
                EmptyView()
            }
            .opacity(0.0)
        }
        .padding(.vertical, 4)
        .listRowSeparator(.hidden)
    }
}
