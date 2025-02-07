//
//  CoffeeView.swift
//  Crema
//
//  Created by Chris Matthews on 02/02/2025.
//

import SwiftUI
import SwiftData

struct CoffeeView: View {
    @Bindable var coffee: Coffee = Coffee(roaster: "Test", name: "Beans")
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("PlaceholderCoffee")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .scaledToFill()
                .containerRelativeFrame(.vertical) { size, axis in
                    size * 0.5
                }
            VStack(alignment: .leading) {
                Text("\(coffee.roaster)").font(.subheadline)
                
                Text("\(coffee.name)").font(.title)
                
                Label("Rating", systemImage: "star.fill")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 16)
                Gauge(value: coffee.rating, in: 0...10) {}
                    currentValueLabel: {
                        Text("\(coffee.rating)")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("10")
                    }
                .gaugeStyle(.accessoryLinear)
                .tint(Gradient(colors: [.red, .yellow, .green]))
                .padding(.bottom, 32)
                
                Label("Tasting Notes", systemImage: "cup.and.heat.waves")
                    .font(.caption)
                    .foregroundStyle(.gray)
                Text("\(coffee.tastingNotes)")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            Spacer()
        }
    }
}

#Preview {
    CoffeeView()
}
