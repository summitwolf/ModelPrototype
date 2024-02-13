//
//  Protocols.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/13/24.
//

import Foundation

protocol AttributeEnum: CaseIterable, Equatable {
    var kind:String {get}
    var ordinal: Int {get}
}

protocol AttributeValues {
    var size: Int {get}
    func getValue(_ ordinal: Int) -> (any AttributeEnum)?
}
