//
//  AnswerViewController.swift
//  whale-ios-kadeem
//
//  Created by Kadeem Palacios on 4/3/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    //MARK:- IB Outlets
    
    @IBOutlet weak var answersTable: UITableView!
     let currentpage = paginationController.sharedInstace.pageHolder
    
    @IBAction func nextPagePressed(_ sender: Any) {


//        paginationController.sharedInstace.save(pageHolder:  paginationController.sharedInstace.pageHolder)
//        paginationController.sharedInstace.load()
        let nextPage = paginationController.sharedInstace.nextPage(pageHolder: currentpage)
       
        APIClient.getAnswers(per_page: 4, page: 1)
        answersTable.reloadData()
        
        
        
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        paginationController.sharedInstace.reset()
    }
    
    @IBAction func lastPagePressed(_ sender: Any) {

//        AnswerManager.sharedInstance.clear()
        answersTable.reloadData()
        paginationController.sharedInstace.save(pageHolder:  paginationController.sharedInstace.pageHolder)
        paginationController.sharedInstace.load()
        let lastPage = paginationController.sharedInstace.lastPage(pageHolder: currentpage)
        APIClient.getAnswers(per_page: 2, page: lastPage)
        answersTable.reloadData()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        answersTable.delegate = self
        answersTable.dataSource = self
        //paginationController.sharedInstace.reset()
        paginationController.sharedInstace.load()
        APIClient.getAnswers(per_page: 2, page: 1)
        
        answersTable.reloadData()
    }


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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "videoPlayerSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "videoPlayerSegue" {
            if let indexPath = answersTable.indexPathForSelectedRow {
                let destVC:VideoPlayerViewController = segue.destination as! VideoPlayerViewController
                destVC.answer = GeneralAnswerManager.sharedInstance.Array[indexPath.row]
                self.show(destVC, sender: self)
                
            }
        }
    }
    
}
