//
//  ViewController.swift
//  SliderTimer
//
//  Created by 정우찬 on 2023/11/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    let initialSeconds: Float = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
    }
    
    func reset() {
        let seconds = Int(initialSeconds * 60)
        mainLabel.text = "\(seconds) 초"
        slider.setValue(initialSeconds, animated: true)
        timer?.invalidate()
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        let seconds = Int(sender.value * 60)
        mainLabel.text = "\(seconds) 초"
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            let seconds = Int((slider.value * 60) - 1)
            
            if seconds >= 0 {
                slider.setValue(Float(seconds) / Float(60), animated: true)
                mainLabel.text = "\(seconds) 초"
            } else {
                AudioServicesPlayAlertSound(SystemSoundID(1322))
                reset()
            }
        }
    }
    
}

