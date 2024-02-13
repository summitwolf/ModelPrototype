//
//  CardDeck.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/13/24.
//

import Foundation

enum CardSuit: AttributeEnum {
    case Clubs
    case Spades
    case Diamonds
    case Hearts
    
    var kind: String {
        "CardSuit"
    }
    
    var ordinal: Int {
        CardSuit.allCases.firstIndex(of: self)!
    }
    
}

enum CardRank: AttributeEnum {
    case Ace
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Ten
    case Jack
    case Queen
    case King
    
    var kind: String {
        "CardRank"
    }
    
    var ordinal: Int {
        CardRank.allCases.firstIndex(of: self)!
    }
    
}

class CardDeck {
    
    let rank  = Attribute<CardRank>()
    let suit = Attribute<CardSuit>()
    let playingCardDeck: AttributeGroupCollection
    init() {
        let playingCardFactory = AttributeGroupCollectionFactory([rank,suit])
        playingCardDeck = playingCardFactory.makeCompleteGroupColection()
    }
    
    func getString() -> String {
        return playingCardDeck.getString()
    }
}
