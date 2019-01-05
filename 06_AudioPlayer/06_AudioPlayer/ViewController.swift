//
//  ViewController.swift
//  06_AudioPlayer
//
//  Created by Maksim Nosov on 14/07/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            if let path = Bundle.main.path(forResource: "song", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            }
        } catch {
            presentAlertView(self, title: "Ошибка", message: "Что-то пошло не так")
        }
        
        self.durationSlider.maximumValue = Float(self.player.duration)
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateDurationSlider), userInfo: nil, repeats: true)
        self.player.play()
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        self.player.pause()
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        self.player.currentTime = 0.0
        self.player.stop()
    }
    
    @IBAction func changeVolumeSlider(_ sender: UISlider) {
        self.player.volume = self.volumeSlider.value
    }
    @IBAction func changeDurationSlider(_ sender: UISlider) {
        if sender == durationSlider {
            sender.minimumValue = 0.0
            sender.maximumValue = Float(self.player.duration)
            self.player.currentTime = TimeInterval(sender.value)
            if self.player.isPlaying {
                self.player.currentTime = TimeInterval(sender.value)
            }
        }
    }
    
    @objc func updateDurationSlider() {
        self.durationSlider.value = Float(self.player.currentTime)
    }
    
    public func presentAlertView(_ vc: UIViewController, title: String, message: String?) {
        var alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        if message != nil {
            alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        }
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
}

