//
//  PlayingCardModel.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/18/24.
//

import Foundation

enum PlayingCardSuit: AttributeEnum {
    case Clubs
    case Spades
    case Diamonds
    case Hearts
    
    var emoji: String {
        switch self {
        case .Clubs:
            return "♣️"
        case .Spades:
            return "♠️"
        case .Diamonds:
            return "♦️"
        case .Hearts:
            return "♥️"
        }
    }
    var kind: String {
        "CardSuit"
    }
    
    var ordinal: Int {
        PlayingCardSuit.allCases.firstIndex(of: self)!
    }
    
}

enum PlayingCardRank: AttributeEnum {
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
    
    var rank: Int {
        switch self {
        case .Ace:
            return 1
        case .Two:
            return 2
        case .Three:
            return 3
        case .Four:
            return 4
        case .Five:
            return 5
        case .Six:
            return 6
        case .Seven:
            return 7
        case .Eight:
            return 8
        case .Nine:
            return 9
        case .Ten:
            return 10
        case .Jack:
            return 11
        case .Queen:
            return 12
        case .King:
            return 13
        }
    }
    
    var name: String {
        switch self {
        case .Ace:
            return "A"
        case .Two:
            return "2"
        case .Three:
            return "3"
        case .Four:
            return "4"
        case .Five:
            return "5"
        case .Six:
            return "6"
        case .Seven:
            return "7"
        case .Eight:
            return "8"
        case .Nine:
            return "9"
        case .Ten:
            return "10"
        case .Jack:
            return "J"
        case .Queen:
            return "Q"
        case .King:
            return "K"
        }
    }
    
    var kind: String {
        "CardRank"
    }
    
    var ordinal: Int {
        PlayingCardRank.allCases.firstIndex(of: self)!
    }
    
}

class PlayingCardGroupFactory: AttributeGroupCollectionFactory<PlayingCardModel> {
    init() {
        super.init([AttributeValues<PlayingCardRank>(),
                    AttributeValues<PlayingCardSuit>()])
    }
}

class PlayingCardDeckModel: AttributeGroupCollection<PlayingCardModel> {
    var deck = [PlayingCardModel]()
    var size: Int {
        deck.count
    }
    
    init() {
        super.init(
            [AttributeValues<PlayingCardRank>(),
             AttributeValues<PlayingCardSuit>()],
            PlayingCardGroupFactory().makeCompleteIndexGroups())
        refreshDeck()
    }
    
    func refreshDeck() {
        deck.append(contentsOf: attributeGroups)
    }
    
    func draw(_ count: Int) -> [PlayingCardModel] {
        var cards = [PlayingCardModel]()
        for _ in 0..<count {
            if let card = draw() {
                cards.append(card)
            }
        }
        return cards
    }
    
    func draw() -> PlayingCardModel? {
        if let index = deck.indices.randomElement() {
            return deck.remove(at: index)
        }
        return nil
    }

}

@Observable class PlayingCardModel: AttributeGroup, CustomStringConvertible, Identifiable {
    var description: String {
        "\(rank.name) \(suit.emoji)"
    }
    var isFaceUp = true
    var rank: PlayingCardRank {
        attributes[0] as! PlayingCardRank
    }
    var suit: PlayingCardSuit {
        attributes[1] as! PlayingCardSuit
    }
    
}
