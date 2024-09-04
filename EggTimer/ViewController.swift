//
//  ViewController.swift
//  EggTimer
//
//  Created by Saavedra Lozano, Miguel on 9/4/24.
//

import UIKit

class ViewController: UIViewController {

    var totalTime = 0
    var secondsRemaining = 0
    var timer = Timer()
    
    var eggTimes: [String : Int] = ["Soft" : 5,
                                "Medium" : 7,
                                "Hard" : 12]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.titleLabel?.text
        totalTime = 60 * eggTimes[hardness!]!
        secondsRemaining = totalTime
        startTimer()
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        reset()
    }
    
    func startTimer() {
        reset()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    func reset() {
        timer.invalidate()
        titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0.0
    }
    
    @objc func timerAction() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            progressBar.progress = (1 - Float(secondsRemaining) / Float(totalTime))
            print(secondsRemaining)
            print(progressBar.progress)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
}

