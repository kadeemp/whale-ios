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
     let currentpage = paginationManager.sharedInstace.pageHolder
    var answerArray = [AnswerModel]()
    var page:Int = 1
    
    @IBAction func nextPagePressed(_ sender: Any) {


//        paginationManager.sharedInstace.save(pageHolder:  paginationManager.sharedInstace.pageHolder)
//        paginationManager.sharedInstace.load()
       // let nextPage = paginationManager.sharedInstace.nextPage(pageHolder: currentpage)
       
        APIClient.getAnswers(per_page: 2, page: paginationManager.sharedInstace.nextPage(pageHolder: self.page), completion: { (answers) in
            self.answerArray += answers //answers
            self.answersTable.reloadData()
        })

        answersTable.reloadData()
    //    APIClient.getQuestions(per_page: 3, page: 1)
       
        
        
        
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        paginationManager.sharedInstace.reset()
    }
    
    @IBAction func lastPagePressed(_ sender: Any) {

//        AnswerManager.sharedInstance.clear()
        answersTable.reloadData()
        paginationManager.sharedInstace.save(pageHolder:  paginationManager.sharedInstace.pageHolder)
        paginationManager.sharedInstace.load()
        let lastPage = paginationManager.sharedInstace.lastPage(pageHolder: currentpage)
        // APIClient.getAnswers(per_page: 2, page: lastPage)
        answersTable.reloadData()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        answersTable.delegate = self
        answersTable.dataSource = self
        //paginationManager.sharedInstace.reset()
        
        APIClient.getAnswers(per_page: 2, page: 1, completion: { (answers) in
            self.answerArray = answers
            self.answersTable.reloadData()
        })
    
    }

    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var normal : UIControlState
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnswerTableViewCell
        let answer = answerArray[indexPath.row]
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
                destVC.answer = answerArray[indexPath.row]
            }
        }
    }
    
}
