//
//  CalculatorResultView.swift
//  calculator-app
//
//  Created by Matúš Klasovitý on 29/04/2022.
//

import SwiftUI

struct CalculatorResultView: View {
    let currentNumberString: String
    let mathExpressions: [MathExpression]
    let mathError: MathError?
    
    var formattedCurrentNumber: String {
        let formatterResult = formatNumber(number: Double(currentNumberString) ?? 0)
        if currentNumberString.contains(".") && !formatterResult.contains(".") {
            return formatterResult + "."
        } else {
            return formatterResult
        }
    }
    
    var calculatorText: String {
        if let mathError = mathError {
            return mathError.rawValue
        }
        return formattedCurrentNumber
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ScrollView(showsIndicators: false) {
                    ScrollViewReader { value in
                        VStack {
                            ForEach(0..<mathExpressions.count, id: \.self) { i in
                                let mathOperation = mathExpressions[i]
                                HStack{
                                    Spacer()
                                    Text(mathOperation.firstNumber.toFormattedString())
                                        .foregroundColor(.textPrimary)
                                        .font(.title)
                                        .fontWeight(.medium)
                                        .minimumScaleFactor(0.01)
                                        .lineLimit(1)
                                    Text(mathOperation.operation)
                                        .foregroundColor(.textOrange)
                                        .font(.title)
                                        .fontWeight(.medium)
                                    
                                    Text(mathOperation.secondNumber.toFormattedString())
                                        .foregroundColor(.textPrimary)
                                        .font(.title)
                                        .fontWeight(.medium)
                                        .minimumScaleFactor(0.01)
                                        .lineLimit(1)
                                }
                            }
                        }.onChange(of: mathExpressions.count) { _ in
                            value.scrollTo(mathExpressions.count)
                        }
                    }
                }
                
            }
            .padding(.bottom)
            HStack {
                Spacer()
                Text(calculatorText)
                    .foregroundColor(.textPrimary)
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
            }
            
        }
    }
}

struct CalculatorResultView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorResultView(
            currentNumberString: "12,939",
            mathExpressions: [],
            mathError: nil
        )
    }
}
