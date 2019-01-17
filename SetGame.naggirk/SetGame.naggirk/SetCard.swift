//
//  SetCard.swift
//  SetGame.naggirk
//
//  Created by Robin Naggi on 1/8/19.
//  Copyright © 2019 Robin Naggi. All rights reserved.
//

import Foundation

struct SetCard {
    
    
    private static var identifierFactory = 0
    private var identifier: Int?
    private var isMatched: Bool
    var cardColor: CardColor
    var cardShape: Shape
    var cardNumber:  NumberOfShapes
    var cardPattern: Pattern
    
    
    init(color: CardColor, shape: Shape, number: NumberOfShapes, pattern: Pattern) {
        cardColor = color
        cardShape = shape
        cardNumber = number
        cardPattern = pattern
        isMatched = false
    }
    
   
    enum CardColor: CaseIterable {
        case red
        case blue
        case green
        var colorIndex: Int {
            switch self {
            case .red:
                return 0
            case .blue:
                return 1
            case .green:
                return 2
            }
        }
    }
    
    enum Shape: CaseIterable {
        
        case square 
        case triangle
        case circle
        var shapeIndex: Int {
            switch self {
            case .triangle:
                return 0
            case .circle:
                return 1
            case .square:
                return 2
            }
        }
    }
    
    enum NumberOfShapes: CaseIterable {
        case one
        case two
        case three
        var num: Int {
            switch self {
            case .one:
                return 0
            case .two:
                return 1
            case .three:
                return 2
            }
        }
    }
    
    enum Pattern: CaseIterable {
        case lined
        case shaded
        case empty
        
        var num: Int {
            switch self {
            case .lined:
                return 0
            case .shaded:
                return 1
            case .empty:
                return 2
            }
        }
    }
    
}

extension SetCard {
    
    func checkForASet(cardArray: [SetCard]) -> Bool {
        if( (cardArray.filter {$0.cardColor == cardArray[0].cardColor }.count == 3) || ((cardArray.filter {$0.cardColor == cardArray[0].cardColor }.count == 1) && (cardArray.filter {$0.cardColor == cardArray[1].cardColor }.count == 1)))
        {
            if( (cardArray.filter {$0.cardNumber == cardArray[0].cardNumber }.count == 3) || ((cardArray.filter {$0.cardNumber == cardArray[0].cardNumber }.count == 1) && (cardArray.filter {$0.cardNumber == cardArray[1].cardNumber }.count == 1)))
            {
                if( (cardArray.filter {$0.cardPattern == cardArray[0].cardPattern }.count == 3) || ((cardArray.filter {$0.cardPattern == cardArray[0].cardPattern }.count == 1) && (cardArray.filter {$0.cardPattern == cardArray[1].cardPattern }.count == 1)))
                {
                    if( (cardArray.filter {$0.cardShape == cardArray[0].cardShape }.count == 3) || ((cardArray.filter {$0.cardShape == cardArray[0].cardShape }.count == 1) && (cardArray.filter {$0.cardShape == cardArray[1].cardShape }.count == 1)))
                    {
                        return true
                    }
                }
            }
        }
        return false
    }
    
}
