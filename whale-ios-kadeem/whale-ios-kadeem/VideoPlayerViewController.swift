//
//  VideoPlayerViewController.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/13/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerViewController: UIViewController {
    @IBOutlet weak var playerView: UIView!
    
    let avPlayer = AVPlayer()
    var avPlayerLayer: AVPlayerLayer!
    var answer:AnswerStruct?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialization code
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        playerView.layer.addSublayer(avPlayerLayer)
        avPlayerLayer.frame = playerView.bounds
        if let answer = answer {
            let vidURL = answer.videoURL
            let url = NSURL(string: String(describing: vidURL))
            let playerItem = AVPlayerItem(url: url! as URL)
            avPlayer.replaceCurrentItem(with: playerItem)
        } else {
            print("answer not passed. vid wont load")
        }
        
        avPlayer.play() // Start the playback
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
