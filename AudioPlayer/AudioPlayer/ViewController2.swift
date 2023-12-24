//
//  ViewController2.swift
//  AudioPlayer
//
//  Created by Begai Bakytovna on 23/12/23.
//

import UIKit
import AVFoundation

class ViewController2: UIViewController {
    
    
    
    @IBOutlet weak var imageSong: UIImageView!
    
    @IBOutlet weak var labelSongName: UILabel!
    
    @IBOutlet weak var labelNameSinger: UILabel!
    
    

    var player = AVAudioPlayer()
    var slider = UISlider()
    
    var name = ""
    var nameSinger = ""
    var imageSong11 = UIImage()
    var timeSong : Double = Double()
    var count = 1
    
    // add artist name
  /*  let artistName : UILabel = {
        let label = UILabel()
        label.text = "unknown"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .blue
        return label
    }()
    //add music name
    let musicName : UILabel = {
        let label = UILabel()
        label.text = "unknown"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .blue
        return label
    }()
    //add artist picture
    let artistPicture : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "nebo1")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()  */
    
    
    
    
    
    //MARK: - Button outlet
    @IBOutlet weak var PlayButton: UIButton!
    private var shouldPlay: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSong.layer.cornerRadius = 5
        imageSong.image = imageSong11
        
        labelSongName.text = name
        labelNameSinger.text = nameSinger
    
        
        
        
        
        
        
        
        //add the slider
        
        self.slider.frame = CGRect(x: 20, y: 650, width: 350, height: 23)
        self.slider.backgroundColor = .white
        self.slider.tintColor = .green
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.view.addSubview(slider)
       //add target
        
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        //add slider timer
        self.time.frame = CGRect(x: 30, y: 680, width: 50, height: 23)
        self.view.addSubview(time)
        
        self.totalTime.frame = CGRect(x: 340, y: 680, width: 50, height: 23)
        self.view.addSubview(totalTime)
        
        //add view for music name and artist name
       /* self.artistName.frame = CGRect(x: 150, y: 500, width: 100, height: 30)
        self.view.addSubview(artistName)
        self.musicName.frame = CGRect(x: 155, y: 550, width: 100, height: 30)
        self.view.addSubview(musicName)
        
        ///add view for artist picture
        self.artistPicture.frame = CGRect(x: 30, y: 150, width: 340, height: 340)
        view.addSubview(artistPicture)
        */
       // getSongs()
       // prepareSong()
       
        
       
      /*  func prepareSong () {
            do {
                let  audioPath = Bundle.main.path(forResource: songList[activeSong], ofType: ".mp3 ")
                try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
                player.prepareToPlay()
            } catch {
                print("error")
            }
        
            }
        func getSongs() {
            let folderUrl = URL(fileURLWithPath: Bundle.main.resourcePath!)
            do {
                let path = try FileManager.default.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                for song in path {
                    var songName = song.absoluteString
                    if songName.contains(".mp3"){
                        let finfString = songName.components(separatedBy: "/")
                        songName = finfString[finfString.count - 1]
                        songName = songName.replacingOccurrences(of: "x20", with: " ")
                        songName = songName.replacingOccurrences(of: " .mp3", with: " ")
                        songList.append(songName)
                        print(songName)
                    }
                }
                //tableView.reloadData()
            }
            catch {
                print("error")
            }
        }
        
        */
        
        
      
        
        
        
        
        
        
        //MARK: -download the music
        do  {
           if let audioPath = Bundle.main.path(forResource: "nebo", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
        self.player.play()
    }
    //MARK: - action for slider
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    let totalTime : UILabel = {
        let label = UILabel ()
        label.text = "-:--"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .blue
        return label
    } ()
    
    func upDateTime () {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.upDate), userInfo: nil, repeats: true)
        slider.maximumValue = Float(player.duration)
        totalTime.text = stringFormatterTimeInterval(interval: player.duration) as String
    }
    func stringFormatterTimeInterval(interval: TimeInterval) -> NSString {
        let ti = NSInteger(interval)
        let second = ti % 60
        let minutes = (ti / 60) % 60
        return NSString(format: "%0.2d:%0.2d", minutes, second)
    }
    ///add the time for slider
    let time : UILabel = {
       let label = UILabel()
        label.text = "-:--"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .blue
        return label
        
    } ()
    
    @objc func upDate (_ timer : Timer) {
        slider.value = Float(player.currentTime)
        time.text = stringFormatterTimeInterval(interval: TimeInterval(slider.value)) as String
        
    }
    
    
    

    //MARK: - Action for play/stop button
    @IBAction func PlayAction(_ sender: Any) {
        
       // self.player.play()
        
        shouldPlay = !shouldPlay
        if shouldPlay {
            play ()
        } else {
            pause()
        }
        
    }
    func play() {
        let pauseImage = UIImage(systemName: "pause.fill")
        PlayButton.setImage(pauseImage, for: .normal)
        player.play()
        upDateTime()
    }
    func pause() {
        let playImage = UIImage(systemName: "play.fill")
        PlayButton.setImage(playImage, for: .normal)
        player.pause()
        upDateTime()
    }
    
    /// action for  back button
    @IBAction func BackButton(_ sender: Any) {
        if self.count < 2 {
            self.count += 1
        } else {
            self.count = 1
        }
        let audioPath = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        
        if audioPath == Bundle.main.path(forResource: "Song2", ofType: "mp3") {
            labelSongName.text = "Nebo"
            labelNameSinger.text = "Timur Temiryazev"
            imageSong.image = UIImage(named: "nebo1")
    
            timeSong = 452
        }
        
        if audioPath == Bundle.main.path(forResource: "Song1", ofType: "mp3") {
            labelSongName.text = "Nasini"
            labelNameSinger.text = "Ragheb Alama"
            imageSong.image = UIImage(named: "dessert")
            timeSong = 552
        }
        self.player.play()
        
        
        
    /// action for nextButton
    }
    
    
    
    @IBAction func NextButton(_ sender: Any) {
        if self.count < 2 {
            self.count += 1
        } else {
            self.count = 1
        }
        let audioPath = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        
        if audioPath == Bundle.main.path(forResource: "Song2", ofType: "mp3") {
            labelSongName.text = "Nebo"
            labelNameSinger.text = "Timur Temiryazev"
            imageSong.image = UIImage(named: "nebo1")
    
            timeSong = 452
        }
        
        if audioPath == Bundle.main.path(forResource: "Song1", ofType: "mp3") {
            labelSongName.text = "Nasini"
            labelNameSinger.text = "Ragheb Alama"
            imageSong.image = UIImage(named: "dessert")
            timeSong = 552
        }
        self.player.play()
        
        
    }
    
    ///  action for hiden Button
    
    @IBAction func closeButton(_ sender: Any) {
        player.pause()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func SharingButtom(_ sender: Any) {
        let activityitem = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Song1", ofType: "mp3")!)
        let activityitem2 = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Song2", ofType: "mp3")!)
        let audiopath = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
        if audiopath == Bundle.main.path(forResource: "Song1", ofType: "mp3"){
            let activityVC = UIActivityViewController(activityItems: [activityitem], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil) }
        else {
            let activityVC = UIActivityViewController(activityItems: [activityitem], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
            
        }
            
            
        }
    
    
    
    
    
}
