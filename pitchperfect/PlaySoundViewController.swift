//
//  PlaySoundViewController.swift
//  pitchperfect
//
//  Created by Sujay Bhowmick on 2/18/17.
//  Copyright © 2017 Sujay Bhowmick. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
    
    var recordedAudioUrl: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    let highPitchNumber: Float = 1000
    let lowPitchNumber: Float = -1000
    let lowRate: Float = 0.5
    let highRate: Float = 1.5
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        scaleAspectFitForButtons()
    }
    
    func scaleAspectFitForButtons(){
        chipmunkButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        vaderButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        snailButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        rabbitButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        echoButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        reverbButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        stopButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: lowRate)
        case .fast:
            playSound(rate: highRate)
        case .chipmunk:
            playSound(pitch: highPitchNumber)
        case .vader:
            playSound(pitch: lowPitchNumber)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
        configureUI(.notPlaying)
    }
}
