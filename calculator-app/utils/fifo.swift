//
//  fifo.swift
//  calculator-app
//
//  Created by Matúš Klasovitý on 01/05/2022.
//

import Foundation

struct FIFO<T> {
    private var _array: [T]
    
    init(initialValues: [T]) {
        self._array = initialValues
    }
    
    init() {
        self._array = []
    }
    
    var count: Int {
        return _array.count
    }
    
    mutating func reset() {
        _array = []
    }
    
    mutating func append(_ value: T) {
        _array.append(value)
    }
    
    mutating func pop() -> T? {
        if _array.count > 0 {
            return _array.remove(at: 0)
        }
        return nil
    }
}
