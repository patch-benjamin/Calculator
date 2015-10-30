//
//  Stack.swift
//  Calculator
//
//  Created by Benjamin Patch on 10/30/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation


class Stack {
    
    private var stackArray: [Float] = []
    
    func pop() -> Float? {
        if stackArray.count > 0 {
            return stackArray.popLast()
        }
        return nil
    }
    
    func push(number: Float) {
        stackArray.append(number)
    }
    
    func log() {
        stackArray.forEach { (number) -> () in
            print("Index: \(stackArray.indexOf(number)) = \(number)")
        }
    }
    
    func count() -> Int{
        return stackArray.count
    }
    
}