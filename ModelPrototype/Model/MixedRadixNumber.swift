//
//  MixedRadixNumber.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/13/24.
//

import Foundation

class MixedRadixNumber: CustomStringConvertible {
    var description: String {
        String("MultiBaseNumber Radixes:\(radixes), Ordinal Range:\(ordinalRange), LargestMRN:\(largestMRN)")
    }
    
    let radixes: [Int]
    let largestMRN: [Int]
    let radixesProduct: [Int]
    let ordinalRange: ClosedRange<Int>
    let numberOfRadixes: Int
    let radixHighIndex: Int
    
    init?(_ radixes: [Int]) {
        guard MixedRadixNumber.isValidRadixes(radixes) else {
            print( "bases must not be empty and must contain only values > 1")
            return nil
        }
        var baseProducts = [Int]()
        let numberOfBases = radixes.count
        let highBaseIndex = numberOfBases-1
        var largestMRN = [Int]()
        for index in 0...highBaseIndex {
            largestMRN.append(radixes[index]-1)
            var product = 1
            for base in index...highBaseIndex {
                product *= radixes[base]
            }
            baseProducts.append(product)
        }
        self.radixes = radixes
        self.largestMRN = largestMRN
        self.radixesProduct = baseProducts
        self.ordinalRange = 0...baseProducts.first!-1
        self.numberOfRadixes = numberOfBases
        self.radixHighIndex = highBaseIndex
    }
    
    static func isValidRadixes(_ bases: [Int]) -> Bool {
        if bases.isEmpty {
            return false
        }
        for value in bases {
            if value <= 1 {
                return false
            }
        }
        return true
    }
    
    private func makeAllPossableMRNs() -> [[Int]] {
        var groups = [[Int]]()
        var group =  [Int](repeating: 0, count: radixes.count)
        while true {
            groups.append(group)
            for index in stride(from: radixHighIndex, through: 0, by: -1) {
                if group[index] < radixes[index]-1 {
                    group[index] += 1
                    break
                } else if index == 0{
                    return groups
                }
                group[index] = 0
            }
        }
    }
    
    func makeRandomMRN() -> [Int] {
        var group = [Int]()
        for value in largestMRN {
            group.append(Int.random(in: 0...value))
        }
        return group
    }
    
    func makeUniqueRandomMRNs(_ count: Int) -> [[Int]]? {
        guard ordinalRange.contains(count-1) else {
            print( "count must be in ordinalRange")
            return nil
        }
        var groups = [[Int]]()
        var ordinalSet = Set<Int>()
        while ordinalSet.count < count {
            ordinalSet.insert(makeOrdinal(makeRandomMRN())!)
        }
        for value in ordinalSet {
            groups.append(makeMRN(value)!)
        }
        return groups
    }
    
    func makeOrdinal(_ group: [Int]) -> Int?  {
        guard MixedRadixNumber.isValidRadixes(group) else {
            print("group size must = numberOfBases and each group[i] must be > 0 and < bases[i]")
            return nil
        }
        var sum = 0
        for index in 0..<radixHighIndex {
            sum += group[index] * radixesProduct[index+1]
        }
        return sum + group.last!
    }
    
    func makeMRN(_ ordinal: Int) -> [Int]? {
        guard ordinalRange.contains(ordinal) else {
            print("ordinal must be in ordinalRange")
            return nil
        }
        var rtn = [Int]()
        var remainder = ordinal
        if numberOfRadixes > 1 {
            for index in 1...radixHighIndex {
                let qr = remainder.quotientAndRemainder(dividingBy: radixesProduct[index])
                remainder = qr.remainder
                rtn.append(qr.quotient)
            }
        }
        rtn.append(remainder)
        return rtn
    }
    
    func makePossableMRNs() -> [[Int]] {
        return makeAllPossableMRNs()
    }
    
}
