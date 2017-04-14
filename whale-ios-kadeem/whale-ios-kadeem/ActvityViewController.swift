//
//  ActvityViewController.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/14/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit

class ActvityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var activityTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GeneralAnswerManager.sharedInstance.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var normal : UIControlState
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnswerTableViewCell
        let answer = GeneralAnswerManager.sharedInstance.Array[indexPath.row]
        let thumbURL = answer.thumbnailURL
        
        let url = URL(string: String(describing: thumbURL))
        let session = URLSession.shared.dataTask(with: url!) {(data,response, error) in
            if let image = UIImage(data: data!) {
                DispatchQueue.main.async {
                    cell.thumbnailButton.setBackgroundImage(image, for: UIControlState.normal)
                    //cell.senderThumbnailImage.image = image
                    cell.setNeedsLayout()
                }
            }
        }
        
        session.resume()
        cell.answerTextLabel.text = answer.answerContent
        
        
        
        
        
        // Configure the cell...
        
        return cell
    }

}
