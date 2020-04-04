//
//  ViewController.swift
//  Xylophone
//
//  Created by Saul Rivera on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        let title = sender.titleLabel?.text ?? "N/A"
        print(title)
        playSound(tone: title)
        
        sender.alpha = sender.alpha / 3
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = sender.alpha * 3
        }
    }
    
    private func playSound(tone: String) {
        guard let url = Bundle.main.url(forResource: tone, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error)
        }
    }
}

