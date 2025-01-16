//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var player: AVAudioPlayer!
   
    var timeLeft = 60.0
    
    var timePassed = 0.0
    
    var totalTime = 0.0
    
    let eggtimes = [
        "Soft": 300.0,
        "Medium": 480.0,
        "Hard": 720.0
    ]
    
    var timer = Timer()
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        titleLabel.text = sender.currentTitle!
        progressView.progress = 0.0
        timer.invalidate()
        timer = Timer()
        let hardness = sender.currentTitle!
        
        
        timeLeft = eggtimes[hardness]!
        totalTime = timeLeft
        timePassed = 0.0
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
        
    }
    
    
    
    @objc func updateCounter() {
        
        //example functionality
        if timeLeft > 0 {
            print("\(timeLeft)")
            timePassed += 1.0
            progressView.progress = Float(timePassed/totalTime)
            timeLeft -= 1.0
           
        }else{
           
            timer.invalidate()
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            titleLabel.text = "The Egg is ready"
        }
        
    
    }
    
    
    
}
