//
//  CoordinatorStuff.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

protocol CoordinatorStuff {
    associatedtype A
    associatedtype B
    
    var factory: A { get }
    var navigationController: B { get }

    func start()
}
