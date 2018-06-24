//
//  Video.swift
//  Match score
//
//  Created by Mrzhy on 2018/6/24.
//  Copyright © 2018年 Mr.Zhao. All rights reserved.
//
import UIKit
import AVKit
import AVFoundation

class Video: UIViewController {
 
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let movieURL =  URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!
            let avPlayer = AVPlayer(url: movieURL as URL)
            
            let playerVC = AVPlayerViewController()
            playerVC.player = avPlayer
            playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
            playerVC.allowsPictureInPicturePlayback = true
            playerVC.showsPlaybackControls = true
            playerVC.view.frame = self.view.bounds
            
            playerVC.player!.play()
            self.view.addSubview(playerVC.view);
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
