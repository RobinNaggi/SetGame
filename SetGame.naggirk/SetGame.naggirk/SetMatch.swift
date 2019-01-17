//
//  SetMatch.swift
//  SetGame.naggirk
//
//  Created by Robin Naggi on 1/9/19.
//  Copyright © 2019 Robin Naggi. All rights reserved.
//

import Foundation

//Set logic all the cards are different or thery're all the same
struct SetMatch {
    private(set) var cards = [SetCard]()
    private(set) var inTheDeck = [SetCard]()
    private(set) var score = 0
    private(set) var matches = [Int]()
    
    init() {
        for color in SetCard.CardColor.allCases
        {
            for shape in SetCard.Shape.allCases
            {
                for number in SetCard.NumberOfShapes.allCases
                {
                    for pattern in SetCard.Pattern.allCases
                    {
                        let card = SetCard(color: color, shape: shape, number: number, pattern: pattern)
                        cards += [card]
                    }
                }
            }
        }
        cards.shuffle()
        cards.shuffle()
        
    }
    //Set logic all the cards are different or they have one thing thats is all the same
    mutating func chooseCard(buttonPressedArray: [Int]) -> Bool {
        var sortedArray = buttonPressedArray
        sortedArray.sort()
        let c1Index = sortedArray[0]
        let c2Index = sortedArray[1]
        let c3Index = sortedArray[2]
        print("\(c1Index) \(c2Index) \(c3Index)")
        let c1 = inTheDeck[c1Index]
        let c2 = inTheDeck[c2Index]
        let c3 = inTheDeck[c3Index]
        let cardArray = [c1,c2,c3]
        var flag = false
        
        if( c1.checkForASet(cardArray: cardArray))
        {
            var count = 0
            for index in sortedArray
            {
                print(index)
                inTheDeck.remove(at: index - count)
                count += 1
            }
            print("AFTER \(inTheDeck.count)")
            flag = true
            score += 10
        }
        score -= 3
        return flag
    }
    
    mutating func setTheDeck() {
        for index in 0 ..< cards.count {
            inTheDeck.append(cards[index])
        }
    }
    
    func getScore() -> Int {
        return score
    }
}


