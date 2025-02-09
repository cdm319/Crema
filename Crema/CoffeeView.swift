//
//  CoffeeView.swift
//  Crema
//
//  Created by Chris Matthews on 02/02/2025.
//

import SwiftUI
import SwiftData

struct CoffeeView: View {
    @Bindable var coffee: Coffee = Coffee(roaster: "Roaster Name", name: "Bean Name")
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(RadialGradient(colors: [.white, .gray], center: .center, startRadius: 10, endRadius: 400))
                    .opacity(0.8)
                    .ignoresSafeArea(edges: .top)
                    .containerRelativeFrame(.vertical) { size, axis in
                        size * 0.5
                    }
                if let pictureData = coffee.pictureData {
                    Image(uiImage: UIImage(data: pictureData)!)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        
                        .scaledToFill()
                        .containerRelativeFrame(.vertical) { size, axis in
                            size * 0.5
                        }
                } else {
                    Image("Placeholder")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        
                        .scaledToFill()
                        .containerRelativeFrame(.vertical) { size, axis in
                            size * 0.5
                        }
                }
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
