//
//  ViewController.swift
//  timerWatch
//
//  Created by GEU on 05/01/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var setTimer: UISegmentedControl!
    @IBOutlet weak var secondCounter: UILabel!
    @IBOutlet weak var minuteCounter: UILabel!
    var timer: Timer?
    var totalSeconds: Int = 0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func timerSelected(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
                case 0:
                    totalSeconds = 10 * 60
                case 1:
                    totalSeconds = 15 * 60
                case 2:
                    totalSeconds = 30 * 60
                default:
                    break
                }
                stopTimer()
                updateLabels()
    }
    
    @IBAction func playTapped(_ sender: Any) {
        if !isRunning && totalSeconds > 0 {
                startTimer()
                updateButtonStates(play: false, pause: true, stop: true)
            }
    }
    
    @IBAction func pauseTapped(_ sender: Any) {
        pauseTimer()
        updateButtonStates(play: true, pause: false, stop: true)
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        stopTimer()
            totalSeconds = 0
            updateLabels()
            updateButtonStates(play: true, pause: false, stop: false)
    }
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    func updateButtonStates(play: Bool, pause: Bool, stop: Bool) {
        playButton.isEnabled = play
        pauseButton.isEnabled = pause
        stopButton.isEnabled = stop

        playButton.tintColor = play ? .systemBlue : .systemGray
        pauseButton.tintColor = pause ? .systemBlue : .systemGray
        stopButton.tintColor = stop ? .systemBlue : .systemGray
    }

    func pauseTimer() {
            timer?.invalidate()
            timer = nil
            isRunning = false
        }

        func stopTimer() {
            timer?.invalidate()
            timer = nil
            isRunning = false
        }
    @objc func updateTimer() {
           if totalSeconds > 0 {
               totalSeconds -= 1
               updateLabels()
           } else {
               stopTimer()
           }
       }
    func updateLabels() {
           let minutes = totalSeconds / 60
           let seconds = totalSeconds % 60

           minuteCounter.text = String(format: "%02d", minutes)
           secondCounter.text = String(format: "%02d", seconds)
       }
}

