//
//  RecordSoundViewController.swift
//  pitchperfect
//
//  Created by Sujay Bhowmick on 2/18/17.
//  Copyright © 2017 Sujay Bhowmick. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scaleApsectFitForButtons()
    }
    
    func scaleApsectFitForButtons(){
        recordButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        stopButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopButton.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundVC = segue.destination as! PlaySoundViewController
            let recordedAudioURL = sender as! URL
            playSoundVC.recordedAudioUrl = recordedAudioURL
        }
    }
    
    @IBAction func recordButtonPressed(_ sender: Any) {
        recordButton.isEnabled = false
        stopButton.isEnabled = true
        recordSound()
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        recordButton.isEnabled = true
        stopButton.isEnabled = false
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    
}

