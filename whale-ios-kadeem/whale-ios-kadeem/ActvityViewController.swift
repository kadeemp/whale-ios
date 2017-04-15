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
        activityTable.delegate = self
        activityTable.dataSource = self
        
        // Do any additional setup after loading the view.
        APIClient.getQuestions(per_page: 3, page: 1)
        activityTable.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
            activityTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        @IBAction func nextPagePressed(_ sender: Any) {
            APIClient.getQuestions(per_page: 3, page: 1)
            activityTable.reloadData()
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
        // activityTable.reloadData()
        print(GeneralQuestionManager.sharedInstance.count)
        return GeneralQuestionManager.sharedInstance.Array.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuestionTableViewCell
        let question = GeneralQuestionManager.sharedInstance.Array[indexPath.row]
        
        cell.questionLabel.text = question.questionContent
   
        
        // Configure the cell...
        
        return cell
    }

}
