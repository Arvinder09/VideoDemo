//
//  SecondViewController.swift
//  VideoDemo
//
//  Created by Arvinder Bhurji on 15/09/22.
//

import UIKit

class SecondViewController : UIViewController {
    
    //@IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoView : VideoPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        let video = VideoPlayer()
        self.videoView.addSubview(video)
    }
    
    /*@IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }*/
}
