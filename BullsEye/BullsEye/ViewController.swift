//
//  ViewController.swift
//  BullsEye
//
//  Created by Bobby McBride on 10/12/18.
//  Copyright © 2018 Bobby McBride. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        score = 0
        round = 0
        startNewRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "target")
        slider.setThumbImage(thumbImageNormal, for: .normal)
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        score += points
        heavyButton()
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            successBuzz()
            points += 100
        } else if difference < 5 {
            title = "So close!"
            if difference == 1 {
                points += 51
            }
        } else if difference < 10 {
            title = "Hey! You're pretty good!"
        } else {
            title = "Juuuust a bit outside..."
        }

        let message = "You hit \(currentValue)!\n" + "You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay!", style: .default, handler: {
            action in
            self.successBuzz()
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        selectionChange()
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func resetGame(){
        score = 0
        round = 0
        startNewRound()
        mediumButton()
    }

    //Haptic Feedback
    @IBAction func successButtonTapped(_ sender: UIButton) {
        successBuzz()
    }

    @IBAction func mediumButtonTapped(_ sender: UIButton) {
        mediumButton()
    }
    
    @IBAction func heavyButtonTapped(_ sender: UIButton) {
        heavyButton()
    }
    
    @IBAction func selectionButtonTapped(_ sender: UIButton) {
        selectionChange()
    }
    
    
    func successBuzz() {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.success)
    }
    
    func selectionChange() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
    
    func mediumButton() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }

    func heavyButton() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }
    
}

