//
//  AnswerTableViewCell.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/10/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import AVFoundation

class AnswerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        videoPlayerView.backgroundColor = UIColor.black
//        avPlayerLayer = AVPlayerLayer(player: avPlayer)
//            
//        videoPlayerView.layer.addSublayer(avPlayerLayer) //addSublayer(avPlayerLayer, at: 0)
//        avPlayerLayer.frame = videoPlayerView.bounds
//        let url = NSURL(string: "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")
//        let playerItem = AVPlayerItem(url: url! as URL)
//        avPlayer.replaceCurrentItem(with: playerItem)

    }
    
//    let avPlayer = AVPlayer()
//    var avPlayerLayer: AVPlayerLayer!

    @IBOutlet weak var answerTextLabel: UILabel!
    
    @IBOutlet weak var senderThumbnailImage: UIImageView!
    @IBOutlet weak var videoPlayerView: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
