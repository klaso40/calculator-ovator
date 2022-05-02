//
//  CalculatorScreenVM.swift
//  calculator-app
//
//  Created by Matúš Klasovitý on 29/04/2022.
//

import Foundation
import SwiftUI


class CalculatorScreenVM: ObservableObject {
    @Published var currentNumberString: String = ""
    @Published var mathError: MathError?
    @Published var lastSelectedKey: CalculatorKey?
    @Published var mathExpressions: [MathExpression] = []
    
    private var _lastSelectedMathOperation: MathOperation?
    private var _numbers = FIFO<Double>()
    
    private var _currentNumber: Double {
        return Double(currentNumberString) ?? 0
    }
    private var _lastSelectedKeyIsMathOperationKey: Bool {
        switch lastSelectedKey {
        case .keyPlus, .keyMinus, .keyDivide, .keyMultiply:
            return true
        default:
            return false
        }
    }
    
    private func _addMathOperation(mathOperation: MathOperation) {
        if _numbers.count == 2 {
            let firstNumber = _numbers.pop()!
            let secondNumber = _numbers.pop()! 
            var expressionResult = firstNumber
            switch mathOperation {
            case .sum:
                expressionResult += secondNumber
            case .subtraction:
                expressionResult -= secondNumber
            case .product:
                expressionResult *= secondNumber
            case .division:
                if secondNumber == 0 {
                    mathError = .divisionByZero
                    return
                }
                expressionResult /= secondNumber
            }
            let newMathExpression = MathExpression(
                firstNumber: firstNumber,
                operation: mathOperation.rawValue,
                secondNumber: secondNumber,
                result: expressionResult
            )
            mathExpressions.append(newMathExpression)
            _numbers.append(expressionResult)
            currentNumberString = expressionResult.toString()
        }
    }
    
    private func _tryAddMathOperation(mathOperation: MathOperation?) {
        _numbers.append(_currentNumber)
        if let mathOperation = mathOperation {
            _addMathOperation(mathOperation: mathOperation)
        }
    }
    
    private func _resetCalculator() {
        currentNumberString = ""
        _lastSelectedMathOperation = nil
        mathExpressions = []
        _numbers.reset()
    }
    
    func onNumberKeyClick(key: CalculatorKey) -> Void {
        if let _ = mathError {
            _resetCalculator()
            self.mathError = nil
        }
        switch key {
        case .keyZero, .keyOne, .keyTwo, .keyThree, .keyFour, .keyFive, .keySix, .keySeven, .keyEight, .keyNine:
            if _lastSelectedKeyIsMathOperationKey {
                currentNumberString = ""
            } else if lastSelectedKey == .keyResult || lastSelectedKey == .keyPercentage  {
                _resetCalculator()
            } else if currentNumberString.count == 10 {
                return
            }
            currentNumberString += String(key.rawValue)
        case .keyDecimal:
            if currentNumberString.count == 10 {
                return
            }
            if _lastSelectedKeyIsMathOperationKey {
                currentNumberString = ""
            }
            if lastSelectedKey == .keyResult {
                _resetCalculator()
            }
            if !currentNumberString.contains("."){
                currentNumberString += "."
            }
        case .keyMultiplyMinusOne:
            if _lastSelectedKeyIsMathOperationKey {
                currentNumberString = ""
            } else if lastSelectedKey == .keyResult || lastSelectedKey == .keyPercentage {
                let currentNumberBeforeReset = _currentNumber
                _resetCalculator()
                currentNumberString = (currentNumberBeforeReset * -1).toString()
            } else {
                currentNumberString = (_currentNumber * -1).toString()
            }
        case .keyPlus:
            if !_lastSelectedKeyIsMathOperationKey && lastSelectedKey != .keyResult  {
                _tryAddMathOperation(mathOperation: _lastSelectedMathOperation)
            }
            _lastSelectedMathOperation = .sum
        case .keyMinus:
            if !_lastSelectedKeyIsMathOperationKey && lastSelectedKey != .keyResult {
                _tryAddMathOperation(mathOperation: _lastSelectedMathOperation)
            }
            _lastSelectedMathOperation = .subtraction
        case .keyDivide:
            if !_lastSelectedKeyIsMathOperationKey && lastSelectedKey != .keyResult  {
                _tryAddMathOperation(mathOperation: _lastSelectedMathOperation)
            }
            _lastSelectedMathOperation = .division
        case .keyMultiply:
            if !_lastSelectedKeyIsMathOperationKey && lastSelectedKey != .keyResult  {
                _tryAddMathOperation(mathOperation: _lastSelectedMathOperation)
            }
            _lastSelectedMathOperation = .product
        case .keyPercentage:
            if lastSelectedKey != .keyPercentage {
                currentNumberString = ((_currentNumber / 100)).toString()
            }
        case .keyResult:
            if lastSelectedKey != .keyResult {
                _tryAddMathOperation(mathOperation: _lastSelectedMathOperation)
            }
        case .keyClear:
            currentNumberString = ""
        case .keyAllClear:
            _resetCalculator()
        }
        lastSelectedKey = key
    }
}
