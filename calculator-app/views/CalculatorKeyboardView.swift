//
//  CalculatorKeyboardView.swift
//  calculator-app
//
//  Created by Matúš Klasovitý on 29/04/2022.
//

import SwiftUI

struct CalculatorKeyboardView: View {
    let onKeyClick: (_ key: CalculatorKey) -> Void
    @Binding var lastSelectedKey: CalculatorKey?
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            Group {
                CalculatorBtnView(
                    text: "C",
                    key: .keyClear,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textGreen)
                CalculatorBtnView(
                    image: Image(systemName: "plus.forwardslash.minus"),
                    key: .keyMultiplyMinusOne,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textGreen)
                CalculatorBtnView(
                    text: "%",
                    key: .keyPercentage,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textGreen)
                CalculatorBtnView(
                    image: Image(systemName: "divide"),
                    key: .keyDivide,
                    onKeyClick: onKeyClick,
                    backgroundColor: lastSelectedKey == .keyDivide ? .textOrange : .btnColor
                )
                .foregroundColor(lastSelectedKey == .keyDivide ? .white : .textOrange)
            }
            Group {
                CalculatorBtnView(
                    text: "7",
                    key: .keySeven,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                    
                CalculatorBtnView(
                    text: "8",
                    key: .keyEight,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "9",
                    key: .keyNine,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "x",
                    key: .keyMultiply,
                    onKeyClick: onKeyClick,
                    backgroundColor: lastSelectedKey == .keyMultiply ? .textOrange : .btnColor
                )
                .foregroundColor(lastSelectedKey == .keyMultiply ? .white : .textOrange)
            }
            
            Group {
                CalculatorBtnView(
                    text: "4",
                    key: .keyFour,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "5",
                    key: .keyFive,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "6",
                    key: .keySix,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "-",
                    key: .keyMinus,
                    onKeyClick: onKeyClick,
                    backgroundColor: lastSelectedKey == .keyMinus ? .textOrange : .btnColor
                )
                .foregroundColor(lastSelectedKey == .keyMinus ? .white : .textOrange)
            }
        
            Group {
                CalculatorBtnView(
                    text: "1",
                    key: .keyOne,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "2",
                    key: .keyTwo,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "3",
                    key: .keyThree,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "+",
                    key: .keyPlus,
                    onKeyClick: onKeyClick,
                    backgroundColor: lastSelectedKey == .keyPlus ? .textOrange : .btnColor
                )
                .foregroundColor(lastSelectedKey == .keyPlus ? .white : .textOrange)
            }
    
            Group {
                CalculatorBtnView(
                    image: Image(systemName: "gobackward"),
                    key: .keyAllClear,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "0",
                    key: .keyZero,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                
                CalculatorBtnView(
                    text: ".",
                    key: .keyDecimal,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textPrimary)
                CalculatorBtnView(
                    text: "=",
                    key: .keyResult,
                    onKeyClick: onKeyClick
                )
                    .foregroundColor(.textOrange)
            }
        }
    }
}

struct CalculatorKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorKeyboardView(
            onKeyClick: { number in
                print(number)
            },
            lastSelectedKey: .constant(nil)
        )
    }
}
