//
//  ContentView.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/13/24.
//

import SwiftUI

class CardMatrix: Identifiable {
    
    let deck = PlayingCardDeckModel()
    var matrix = [[PlayingCardModel]]()
    let rows: Int
    let columns: Int
    
    init(_ rows: Int,_ columns: Int) {
        self.rows = rows
        self.columns = columns
        for _ in 0..<rows {
            let row = deck.draw(columns)
            matrix.append(row)
        }
    }
    
    func getCardCount() -> Int {
        deck.size
    }
    
}

struct ContentView: View {
    @State var cardMatrix = CardMatrix(7, 7)
    var body: some View {
        Text("Deck Size: \(cardMatrix.getCardCount())")
        Grid {
            ForEach(0..<cardMatrix.rows,id: \.self) { row in
                GridRow {
                    ForEach(0..<cardMatrix.columns,id: \.self) { column in
                        PlayingCardView(card: cardMatrix.matrix[row][column])
                   }
                }
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
