//
//  AttributeGroupCollectionFactory.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/13/24.
//

import Foundation

class AttributeGroupCollectionFactory<T:AttributeGroup>: MixedRadixNumber {
    
    let attributes: [any IndexedValues]
    
    init(_ attributes: [any IndexedValues]) {
        self.attributes = attributes
        var bases = [Int]()
        for attribute in attributes {
            bases.append(attribute.size)
        }
        super.init(bases)!
    }
    
    func makeCompleteIndexGroups() -> [[Int]]{
        makePossableMRNs()
    }
    
    func makeCompleteGroupColection() -> AttributeGroupCollection<T> {
        AttributeGroupCollection<T>(attributes,makeCompleteIndexGroups())
    }

}
