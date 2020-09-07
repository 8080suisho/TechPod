//
//  ViewController.swift
//  TechPod
//
//  Created by 諸星水晶 on 2020/09/06.
//  Copyright © 2020 Mizuki Morohoshi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
//    storyboardで扱うTableViewを宣言
    @IBOutlet var table:UITableView!
    var songNameArray = [String]()
    var fileNameArray = [String]()
    var imageNameArray = [String]()
    
    var audioPlayer : AVAudioPlayer!
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = songNameArray[indexPath.row]
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        audioPlayer.play()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self
        
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        fileNameArray = ["cannon","elise","aria"]
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }


}

