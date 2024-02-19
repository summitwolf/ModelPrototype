//
//  PlayingCardView.swift
//  ModelPrototype
//
//  Created by Franklin Whitehurst on 2/18/24.
//

import SwiftUI
struct PlayingCardView: View {
    
    var card:PlayingCardModel
    let bounds = CGRect(x: 0, y: 0, width: 25, height: 40)
    let fontScale: CGFloat = 0.8
    let cornerRadius: CGFloat = 5
   
    var body: some View {
        return Button(action: {
            card.isFaceUp = !card.isFaceUp
        }, label: {
            Image(uiImage: makeFeatureGroupImage())
        })
        .shadow(radius: 5)
    }
    
    
    public func makeFeatureGroupImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        let image = renderer.image { _ in
            let backgroundPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).setFill()
            backgroundPath.fill()
            if card.isFaceUp {
                let suitValue = card.suit.emoji
                let rankString = card.rank.name
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                let attrs = [NSAttributedString.Key.font:
                    UIFont(name: "HelveticaNeue", size: (bounds.height / 2) * fontScale)!,
                             NSAttributedString.Key.paragraphStyle: paragraphStyle]
                suitValue.draw(with:CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height / 2),
                               options: .usesLineFragmentOrigin,
                               attributes: attrs, context: nil)
                rankString.draw(with: CGRect(x: bounds.minX, y: bounds.height / 2, width: bounds.width, height: bounds.height / 2),
                                options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
            }
        }
        return image.withRenderingMode(.alwaysOriginal)
    }

}

#Preview {
    PlayingCardView(card: PlayingCardModel([PlayingCardRank.Ace,PlayingCardSuit.Hearts]))
}
