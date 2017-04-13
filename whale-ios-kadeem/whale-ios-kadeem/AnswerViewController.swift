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

        AnswerManager.sharedInstance.clear()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnswerTableViewCell
        let answer = GeneralAnswerManager.sharedInstance.Array[indexPath.row]
        let thumbURL = answer.thumbnailURL
        
        let url = URL(string: String(describing: thumbURL))
        let session = URLSession.shared.dataTask(with: url!) {(data,response, error) in
            if let image = UIImage(data: data!) {
                DispatchQueue.main.async {
                    cell.senderThumbnailImage.image = image 
                    cell.setNeedsLayout()
                }
            }
        }
        
        session.resume()
        cell.answerTextLabel.text = answer.answerContent
        
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
