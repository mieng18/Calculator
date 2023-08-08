//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by mai nguyen on 8/7/23.
//

import SwiftUI

enum CalculatorButton: String {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case zero
    case add
    case subtract
    case divide
    case multiply
    case equal
    case clear
    case decimal
    case percent
    case negtive
    
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
