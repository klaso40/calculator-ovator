//
//  CalculatorScreen.swift
//  calculator-app
//
//  Created by Matúš Klasovitý on 29/04/2022.
//

import SwiftUI

struct CalculatorScreen: View {
    @StateObject
    private var calculatorScreenVM = CalculatorScreenVM()
    
    var body: some View {
        VStack {
            CalculatorResultView(
                currentNumberString: calculatorScreenVM.currentNumberString,
                mathExpressions: calculatorScreenVM.mathExpressions,
                mathError: calculatorScreenVM.mathError
            )
            .padding(.horizontal)
            
            CalculatorKeyboardView(
                onKeyClick: calculatorScreenVM.onNumberKeyClick,
                lastSelectedKey: $calculatorScreenVM.lastSelectedKey
            )
                .padding(.top, 40)
                .padding(.bottom, 70)
                .padding(.horizontal)
                .background(Color.backgroundSecondary)
                .cornerRadius(40, corners: [.topLeft, .topRight])
            
        }
        .offset(y: 40)
        .background(Color.backgroundPrimary)
    }
}

struct CalculatorScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorScreen()
            .preferredColorScheme(.dark)
    }
}
