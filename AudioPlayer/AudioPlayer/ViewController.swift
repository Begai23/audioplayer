//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Begai Bakytovna on 23/12/23.
//

import UIKit

// Music change value
var songList : [String] = []
var songImage : [String] = []
var activeSong  = 0

import AVFoundation

var audioPlayer = AVAudioPlayer()



class ViewController: UIViewController {

 //image
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var SecondImage: UIImageView!
    
    @IBOutlet weak var firstSongName: UILabel!

    @IBOutlet weak var secondSongName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ///first music
        if segue.identifier == "Show",
           let destination = segue.destination as? ViewController2 {
            destination.name = "nebo"
            destination.nameSinger = "Timur Temiryazev"
            destination.imageSong11 = firstImage.image!
            destination.timeSong = 451
            
            do {
                if let audioPath = Bundle.main.path(forResource: "Song2", ofType: "mp3"){
                    try destination.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    }
            } catch {
                print("error")
            }
            destination.player.play()
        }
        
        
        
        
        
        
        
        
        
        
        
        
        //secod music
        if segue.identifier == "Show1",
           let destination = segue.destination as? ViewController2 {
            destination.name = "Nasini"
            destination.nameSinger = "Ragheb Alama"
            destination.imageSong11 = SecondImage.image!
            destination.timeSong = 237
            
            do {
                if let audioPath = Bundle.main.path(forResource: "Song1", ofType: "mp3"){
                    try destination.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    }
            } catch {
                print("error")
            }
            destination.player.play()
        }
    }
    
    
    
    
    
    

}

