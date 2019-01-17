//
//  ViewController.swift
//  SetGame.naggirk
//
//  Created by Robin Naggi on 1/8/19.
//  Copyright © 2019 Robin Naggi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var game = SetMatch()
    var buttonsPressed = [Int]()
    var buttonPressCount = 0
    
    let shapeArray = ["▲", "⬤", "◼︎"]
    let colorArray = [#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
    let numberArray = [1,2,3]
    let shading = [0.15,-8.0, 8.0]
    
    @IBOutlet weak var outOfCardsLabel: UITextView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet var cardButtons: [UIButton]!
    var visable = 11
    
    @IBOutlet weak var threeMoreCards: UIButton!
    @IBAction func threeNewCardButton(_ sender: UIButton) {
        if game.inTheDeck.count >= visable {
            if buttonsPressed.count == 3 {
                let check = game.chooseCard(buttonPressedArray: buttonsPressed)
                print("If the count is 3 check")
                if check {
                    outOfCardsLabel.text = "Found a set"
                    outOfCardsLabel.isHidden = false
                    outOfCardsLabel.textColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
                    visable = visable - 3
                    makeButtons(visable)
                    scoreLabel.text = "Score: \(game.getScore())"
                    //cardButtons[buttonsPressed[3]].backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
                    //buttonsPressed = [buttonsPressed[3]]
                    //buttonPressCount = 0
                } else {
                    outOfCardsLabel.text = "Not a set"
                    outOfCardsLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                    scoreLabel.text = "Score: \(game.getScore())"
                    outOfCardsLabel.isHidden = false
                    //cardButtons[buttonsPressed[2]].backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
                    //buttonsPressed = [buttonsPressed[3]]
                    //buttonsPressed.append(buttonsPressed[3])
                    buttonPressCount = 1
                    if visable <= 23 {
                        for index in 0 ..< cardButtons.count {
                            if index > visable {
                                cardButtons[index].isHidden = true
                                cardButtons[index].isEnabled = false
                            }
                            else {
                                cardButtons[index].isHidden = false
                                cardButtons[index].isEnabled = true
                            }
                        }
                        //makeButtons(visable)
                        //visable += 3
                    }
                    buttonsPressed = []
                    buttonPressCount = 0
                }
                for index in 0 ..< cardButtons.count {
                    cardButtons[index].backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
                }
            }
            outOfCardsLabel.isHidden = true
            print(visable)
            if game.inTheDeck.count <= 24
            {
                threeMoreCards.isEnabled = false
                threeMoreCards.isHidden = true
                outOfCardsLabel.text =  "Out of Cards"
            }
            print("Taped more cards")
            
            if visable <= 23 {
                for index in 0 ..< cardButtons.count {
                    if index > visable {
                        cardButtons[index].isHidden = true
                        cardButtons[index].isEnabled = false
                    }
                    else {
                        cardButtons[index].isHidden = false
                        cardButtons[index].isEnabled = true
                    }
                }
                makeButtons(visable)
                visable += 3
            }
            else
            {
                outOfCardsLabel.text = "Already 24 cards out"
                outOfCardsLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                outOfCardsLabel.isHidden = false
                
            }
            print(visable)
        }
    }
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true
        
        if buttonsPressed.contains(cardButtons.index(of: sender)!) {
            cardButtons[cardButtons.index(of: sender)!].backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
            buttonPressCount -= 1
            buttonsPressed.remove(at: buttonPressCount )
            //sender.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        }
        else {
            buttonsPressed.append(cardButtons.index(of: sender)!)
            buttonPressCount += 1
            sender.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        }
        outOfCardsLabel.isHidden = true
        
        if buttonPressCount == 4 {
            print("Before \(game.inTheDeck.count)")
            let check = game.chooseCard(buttonPressedArray: [buttonsPressed[0], buttonsPressed[1], buttonsPressed[2]])
            print(check)
            if check {
                outOfCardsLabel.text = "Found a set"
                outOfCardsLabel.isHidden = false
                outOfCardsLabel.textColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
                scoreLabel.text = "Score: \(game.getScore())"
                visable = visable - 3
                makeButtons(visable)
                if game.inTheDeck.count >= visable {
                    visable += 3
                }
                cardButtons[buttonsPressed[3]].backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
                buttonsPressed = [buttonsPressed[3]]
                buttonPressCount = 1
            } else {
                outOfCardsLabel.text = "Not a set"
                outOfCardsLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                outOfCardsLabel.isHidden = false
                scoreLabel.text = "Score: \(game.getScore())"
                cardButtons[buttonsPressed[3]].backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
                buttonsPressed = [buttonsPressed[3]]
                //buttonsPressed.append(buttonsPressed[3])
                buttonPressCount = 1
            }
            
            for index in 0 ..< cardButtons.count {
                if buttonsPressed[0] != index {
                    
                    cardButtons[index].backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
                }
            }
        }
        
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = SetMatch()
        visable = 11
        updateViewFromModel()
        for index in 0 ..< cardButtons.count {
            cardButtons[index].backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
        }
        scoreLabel.text = "Score: 0"
        makeButtons(visable)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
        print("In the deck \(game.inTheDeck.count)")
        
    }
    
    /// Updates the app depending on the if cards are face up or not
    private func updateViewFromModel() {
        for index in 0 ..< cardButtons.count{
            cardButtons[index].layer.cornerRadius = 10.0
            cardButtons[index].isHidden = true
            cardButtons[index].isEnabled = false
        }
        game.setTheDeck()
        outOfCardsLabel.isEditable = false
        outOfCardsLabel.isHidden = true
    }
    
    func makeButtons(_ end: Int) {
        //let result = " "
        if game.inTheDeck.count >= visable {
        if end > 0 {
            for index in 0 ... end
            {
                let tempTable = game.inTheDeck[index]
                
                if tempTable.cardPattern.num == 0 {
                    let attributes: [NSAttributedString.Key: Any] = [
                        .strokeWidth : -8.0,
                        .strokeColor : colorArray[tempTable.cardColor.colorIndex],
                        .foregroundColor: colorArray[tempTable.cardColor.colorIndex].withAlphaComponent(0.25)
                    ]
                    let attributedString = NSAttributedString(string: String(repeating: shapeArray[tempTable.cardShape.shapeIndex], count: numberArray[tempTable.cardNumber.num]), attributes: attributes)
                    
                    cardButtons[index].setAttributedTitle(attributedString, for: UIControl.State.normal)
                    
                } else if tempTable.cardPattern.num == 1 {
                    let attributes: [NSAttributedString.Key: Any] = [
                        .strokeWidth : shading[tempTable.cardPattern.num],
                        .strokeColor : colorArray[tempTable.cardColor.colorIndex],
                        .foregroundColor: colorArray[tempTable.cardColor.colorIndex].withAlphaComponent(1.0)
                    ]
                    let attributedString = NSAttributedString(string: String(repeating: shapeArray[tempTable.cardShape.shapeIndex], count: numberArray[tempTable.cardNumber.num]), attributes: attributes)
                    
                    cardButtons[index].setAttributedTitle(attributedString, for: UIControl.State.normal)
                } else {
                    let attributes: [NSAttributedString.Key: Any] = [
                        .strokeWidth : 8.0,
                        .strokeColor : colorArray[tempTable.cardColor.colorIndex]
                    ]
                    let attributedString = NSAttributedString(string: String(repeating: shapeArray[tempTable.cardShape.shapeIndex], count: numberArray[tempTable.cardNumber.num]), attributes: attributes)
                    
                    cardButtons[index].setAttributedTitle(attributedString, for: UIControl.State.normal)
                }
                
            }
            for index in (end + 1) ..< cardButtons.count
            {
                cardButtons[index].isHidden = true
                cardButtons[index].isEnabled = false
            }
        }
    }
        
    }
    
    func makeNSAString(shadedIndex: Int) {
        
    }
    
}

