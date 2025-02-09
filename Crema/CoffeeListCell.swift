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
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(RadialGradient(colors: [.white, .gray], center: .center, startRadius: 10, endRadius: 100))
                        .opacity(0.8)
                        .containerRelativeFrame(.horizontal) { size, axis in
                            size * 0.33
                        }
                        
                    if let pictureData = coffee.pictureData {
                        Image(uiImage: UIImage(data: pictureData)!)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(1.0, contentMode: .fit)
                            .containerRelativeFrame(.horizontal) { size, axis in
                                size * 0.33
                            }
                    } else {
                        //placeholder image
                        Image("PlaceholderCoffee")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(1.0, contentMode: .fit)
                            .containerRelativeFrame(.horizontal) { size, axis in
                                size * 0.33
                            }
                    }
                }
                
                
                VStack(alignment: .leading) {
                    Text("\(coffee.roaster)")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Text("\(coffee.name)")
                        .font(.title3)
                    Capsule(style: .continuous)
                        .fill(ratingColour())
                        .frame(width: 50, height: 30)
                        .overlay(
                                Text("\(String(format: "%.1f", coffee.rating))")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                        )
                }
                .padding(.horizontal, 16)
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
        .listRowBackground(Color.clear)
        .scrollContentBackground(.hidden)
    }
    
    private func ratingColour() -> Color {
        switch coffee.rating {
        case 0..<3.5:
            return .red
        case 3.5..<5.5:
            return .orange
        case 5.5..<7.5:
            return .yellow
        default:
            return .green
        }
    }
}

#Preview {
    List {
        CoffeeListCell(coffee: Coffee(roaster: "Dark Arts Coffee Roasters", name: "Mud Wizard", pictureData: UIImage(named: "MudWizard")?.pngData(), tastingNotes: "", rating: 8.0))
        CoffeeListCell(coffee: Coffee(roaster: "200 Degrees", name: "Brazilian Love Affair", pictureData: UIImage(named: "RedBrick")?.pngData(), tastingNotes: "", rating: 6.5))
        CoffeeListCell(coffee: Coffee(roaster: "Limini Coffee Roasters", name: "Limini Blend", pictureData: UIImage(named: "LiminiBlend")?.pngData(), tastingNotes: "", rating: 3.0))
    }
    .listStyle(.plain)
    .padding(.top, 8)
}
