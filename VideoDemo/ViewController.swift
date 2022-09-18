//
//  ViewController.swift
//  VideoDemo
//
//  Created by Arvinder Bhurji on 14/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    let Dict = Dictionary()
    var videoUrl : String?
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "videocell")
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videocell", for: indexPath)
        cell.textLabel?.text = Dict.channels[indexPath.row]["name"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Dict.channels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        videoUrl = Dict.channels[indexPath.row]["live_channel_link"]
        performSegue(withIdentifier: "goToVideo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToVideo"){
            _ = segue.destination as! SecondViewController
        }
    }
    
    
}
