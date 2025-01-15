//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    var timeLeft = 60.0
    var timePassed = 0.0
    var totalTime = 0.0
    let eggtimes = [
        "Soft": 3.0,
        "Medium": 4.0,
        "Hard": 7.0
    ]
    
    var timer = Timer()
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        timeLeft = eggtimes[hardness]!
        totalTime = timeLeft
        
        
        counterDown()
        
        
        
       
        
        
    }
    
    func counterDown(){
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func updateCounter() {
        progressView.progress = Float(timePassed/totalTime)
        //example functionality
        if timeLeft > 0 {
            print("\(timeLeft)")
          
            timeLeft -= 1
            timePassed += 1
        }else{
            timer.invalidate()
            titleLabel.text = "The Egg is ready"
        }
        
    
    }
    
    
    
}
