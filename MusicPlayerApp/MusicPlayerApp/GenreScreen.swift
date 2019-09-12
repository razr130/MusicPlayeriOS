//
//  GenreScreen.swift
//  MusicPlayerApp
//
//  Created by Johanes Vincent Fernando on 12/09/19.
//  Copyright © 2019 SpaceColony. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreScreen: UIViewController {
    
    @IBOutlet weak var BtnKpop: UIButton!
    @IBOutlet weak var BtnAniSong: UIButton!
    @IBOutlet weak var BtnPop: UIButton!
    
    var musicplayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnKpop.layer.cornerRadius = 10
        BtnAniSong.layer.cornerRadius = 10
        BtnPop.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GenreButtonClicked(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
    }
    
    @IBAction func StopButtonClicked(_ sender: UIButton) {
        musicplayer.stop()
    }
    
    @IBAction func NextButtonClicked(_ sender: UIButton) {
        musicplayer.skipToNextItem()
    }
    
    
    func playGenre(genre: String){
        musicplayer.stop()
        let query = MPMediaQuery()
        let predict = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predict)
        musicplayer.setQueue(with: query)
        musicplayer.shuffleMode = .songs
        musicplayer.play()
        
    }
}
