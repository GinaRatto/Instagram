//
//  InstagramFeedViewController.swift
//  Instagram
//
//  Created by Gina Ratto on 2/23/17.
//  Copyright © 2017 Gina Ratto. All rights reserved.
//

import UIKit
import Parse

class InstagramFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var feed: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 450

        self.tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        let query = PFQuery(className: "Post")
        query.order(byDescending: "_created_at")
        query.includeKey("author")
        query.limit = 20

        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
            if let posts = posts {
                self.feed = posts
                self.tableView.reloadData()
            }
            else {
                print(error?.localizedDescription)
            }
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        
        let post = feed[indexPath.row]
        cell.captionLabel.text = post["caption"] as! String?
        cell.usernameLabel.text = post["username"] as! String?
        
        let photo = post["media"] as! PFFile
        photo.getDataInBackground { (data: Data?, error: Error?) in
            if let data = data {
                cell.photoImageView.image = UIImage(data: data)
            }
            else {
                print(error?.localizedDescription)
            }
        }
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
