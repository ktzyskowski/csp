//
//  ViewController.swift
//  MLKSoundboardApp
//
//  Created by Kevin Zyskowski on 9/28/18.
//  Copyright © 2018 Kevin Zyskowski. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {

    var mlkSoundEffect: AVAudioPlayer?
    var path: String?
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        path = Bundle.main.path(forResource: "king.mp3", ofType: nil)!
        url = URL(fileURLWithPath: path!)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))  
        
        do {
            if mlkSoundEffect != nil {
                if mlkSoundEffect!.isPlaying {
                    mlkSoundEffect?.pause()
                } else {
                    mlkSoundEffect?.play()
                }
            } else {
                mlkSoundEffect = try AVAudioPlayer(contentsOf: url!)
                mlkSoundEffect?.play()
            }
        } catch {
            // error loading audio file
        }
        
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let string = "My name is Malcolm X"
            let utterance = AVSpeechUtterance(string: string)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            
            let synth = AVSpeechSynthesizer()
            synth.speak(utterance)
        }
    }
    
}

