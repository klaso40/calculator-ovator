//
//  ContentView.swift
//  calculator-app
//
//  Created by Matúš Klasovitý on 29/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CalculatorScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
