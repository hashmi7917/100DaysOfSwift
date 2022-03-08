//
//  WebListTVC.swift
//  Project4
//
//  Created by hashmi on 08/03/22.
//

import UIKit
import WebKit

class WebListTVC: UITableViewController {

    var websites = ["apple.com", "hackingwithswift.com", "google.com", "stackoverflow.com", "designcode.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Web Browser"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebList", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Browser") as? ViewController {
            vc.selectedSite = websites[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
