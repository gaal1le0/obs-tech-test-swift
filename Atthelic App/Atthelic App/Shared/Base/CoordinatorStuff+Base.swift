//
//  CoordinatorStuff.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

protocol CoordinatorStuff {
    associatedtype A
    var factory: A { get }
    func start()
}
