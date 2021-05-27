//
//  ViewController.swift
//  Sapp
//
//  Created by abdullah FH  on 15/10/1442 AH.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer : AVAudioPlayer!
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var MyView: UIView!
    
    @IBOutlet weak var PlayOutLet: UIButton!
    
    @IBOutlet weak var PauseOutLet: UIButton!
    
    @IBOutlet weak var RestartOutLet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyAudio()
        self.MyView.layer.cornerRadius = 30
    }
    func MyAudio(){
        do {
        audioPlayer = try AVAudioPlayer(contentsOf:URL.init(fileURLWithPath: Bundle.main.path(forResource: "MyAudio", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.playback)
            } catch {
                
            }
            
        } catch {
            print(error)
        }
    }

    
    @IBAction func Play(_ sender: Any) {
        self.ImageView.layer.borderWidth = 1
        self.ImageView.layer.masksToBounds = false
        self.ImageView.layer.borderColor = UIColor.black.cgColor
        self.ImageView.layer.cornerRadius =     self.ImageView.frame.height/2
        self.ImageView.clipsToBounds = true
        self.ImageView.image = UIImage(named: "عبدالكريم")
        self.Label.text = "عبدالكريم عبدالقادر"
        self.PlayOutLet.tintColor = .red
        audioPlayer.play()
        self.PauseOutLet.tintColor = .systemBlue
    }
    
    
    @IBAction func Pause(_ sender: Any) {
        if audioPlayer.isPlaying {
            self.PauseOutLet.tintColor = .red
            self.PlayOutLet.tintColor = .systemBlue
            audioPlayer.pause()
        } else {
            
        }
    }
    
    
    @IBAction func Restart(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.currentTime = 0
         
        } else {
       
        }
    }
    
}

