//
//  ArrayExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/5/16.
//  Copyright © 2016 SwifterSwift
//
import CoreData

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    func isset(_ index: Int) -> Bool {
        if self.indices.contains(index) {
            return true
        } else {
            return false
        }
    }
}
