//
//  VideoPlayer.swift
//  VideoDemo
//
//  Created by Arvinder Bhurji on 16/09/22.
//

import AVKit
import AVFoundation

class VideoPlayer : UIView {
    
    @IBOutlet weak var videoView: UIView!
    var player : AVPlayer?
    var avPlayerLayer : AVPlayerLayer?
    //@IBOutlet weak var videoView : UIView!
    let pausePlay = UIImageView()
    let loader = UIActivityIndicatorView(style: .white)
    var isVideoPlaying = true
    
    
    let controlView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
        startVideo()
        
        controlView.frame = videoView.bounds
        videoView.addSubview(controlView)
        
        //pausePlaybtn()
    }
    
    func commitInit() {
        let view = Bundle.main.loadNibNamed("VideoPlayer", owner: self, options: nil)![0] as! UIView
        addSubview(view)
        view.frame = self.bounds
    }
    
    func startVideo() {
        let url = URL(string: "https://d2g1p@cv65b13g.cloudfront.net/abphls/2022/09/bWVkLTE2Nj120TM20DCAU/240p/index.m3u8")
        let asset = AVAsset(url: url!)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        avPlayerLayer =
        AVPlayerLayer(player: player)
        avPlayerLayer?.frame = self.videoView.bounds
        avPlayerLayer?.videoGravity = AVLayerVideoGravity.resize
        self.videoView.layer.addSublayer(avPlayerLayer!)
        player!.play()
    }
    
    func loading() {
        loader.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loader)
        loader.startAnimating()
        NSLayoutConstraint.activate([
        loader.widthAnchor.constraint(equalToConstant: 30),
        loader.heightAnchor.constraint(equalToConstant: 30),
        loader.centerXAnchor.constraint(equalTo: centerXAnchor),
        loader.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    /*func pausePlaybtn() {
        pausePlay.isUserInteractionEnabled = true
        pausePlay.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pausePlayAction)))
        addSubview(pausePlay)
        pausePlay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pausePlay.widthAnchor.constraint(equalToConstant: 40),
            pausePlay.heightAnchor.constraint(equalToConstant: 40),
            pausePlay.centerXAnchor.constraint(equalTo: centerXAnchor),
            pausePlay.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        pausePlay.tintColor = .white
        pausePlay.image = UIImage(systemName: "pause.fill")
    }*/
}
