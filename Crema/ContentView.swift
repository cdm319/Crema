//
//  ContentView.swift
//  Crema
//
//  Created by Chris Matthews on 02/02/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Coffee.rating, order: .reverse) private var coffees: [Coffee]
    @State var showAddCoffeeSheet: Bool = false
    
    let backgroundGradient = LinearGradient(
        colors: [
            //Color(red: 0.9254901960784314, green: 0.9137254901960784, blue: 0.9019607843137255), //silver
            Color.white,
            //Color(red: 0.8549019607843137, green: 0.8862745098039215, blue: 0.9725490196078431), //blue
            //Color(red: 0.8392156862745098, green: 0.6431372549019608, blue: 0.6431372549019608), //pink
        ],
        startPoint: .top, endPoint: .bottom)

    var body: some View {
        NavigationStack {
            List(coffees) { coffee in
                CoffeeListCell(coffee: coffee)
            }
            .listStyle(.plain)
            .padding(.top, 8)
            
            .sheet(isPresented: $showAddCoffeeSheet) {
                AddCoffeeView()
                
                .presentationDetents([.medium])
                .presentationDragIndicator(.hidden)
            }
            
            .toolbar {
                ToolbarItem {
                    Button(action: {showAddCoffeeSheet = true}) {
                        Label("Add Coffee", systemImage: "plus.circle.fill")
                            .foregroundStyle(.primary)
                            .font(.system(size: 24))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            
            .scrollContentBackground(.hidden)
            .background(backgroundGradient)
        }
        
    }
    
    private func deleteCoffees(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(coffees[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
