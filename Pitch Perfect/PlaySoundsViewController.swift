//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Boris Alexis Gonzalez Macias on 3/12/15.
//  Copyright (c) 2015 PropiedadFacil. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer!
    var receivedAudio : RecordedAudio!
    var engine : AVAudioEngine!
    var audioFile : AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        engine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func change_rate(rate: Float){
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        engine.stop()
        engine.reset()
        audioPlayer.rate = rate
        audioPlayer.play()
    }
    
    func change_pitch(pitch: Float){
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        engine.stop()
        engine.reset()
        var node = AVAudioPlayerNode()
        engine.attachNode(node)
        var pitchEffect = AVAudioUnitTimePitch()
        pitchEffect.pitch = pitch
        engine.attachNode(pitchEffect)
        engine.connect(node, to: pitchEffect, format: nil)
        engine.connect(pitchEffect, to: engine.outputNode, format: nil)
        node.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        engine.startAndReturnError(nil)
        node.play()
    }
    
    @IBAction func SnailSound(sender: UIButton) {
        change_rate(0.5)
    }
    @IBAction func RabbitSound(sender: UIButton) {
        change_rate(1.5)
    }
    @IBAction func StopSound(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        engine.stop()
        engine.reset()
    }
    @IBAction func chipmunk(sender: UIButton) {
        change_pitch(1000)
    }
    @IBAction func darth(sender: UIButton) {
        change_pitch(-1000)
    }
}
