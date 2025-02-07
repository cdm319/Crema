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
                ToolbarItem(placement: .principal) {
                    Text("Crema")
                        .bold()
                        .foregroundColor(Color(red: 73/255, green: 54/255, blue: 40/255))
                }
                ToolbarItem {
                    Button(action: {showAddCoffeeSheet = true}) {
                        Label("Add Coffee", systemImage: "plus")
                    }
                }
            }
            .toolbarBackground(Color(red: 214/255, green: 192/255, blue: 179/255), for:.navigationBar)
            .toolbarBackground(.visible, for:.navigationBar)
            .navigationBarTitleDisplayMode(.inline)
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
