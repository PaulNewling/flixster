//
//  TrailerViewController.swift
//  flixster
//
//  Created by Paul Newling on 2/15/21.
//  Copyright © 2021 Paul Newling. All rights reserved.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController , WKUIDelegate{
    @IBOutlet weak var trailerWebView: WKWebView!
   
    
    
    var movieID: Int = 0
    var movieData = [[String:Any?]]()
    var key: String = ""
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        trailerWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        trailerWebView.uiDelegate = self
        view = trailerWebView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseUrl = "https://api.themoviedb.org/3/movie/"
        let getVideoUrl = "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"
        let fullUrl = URL(string: baseUrl + String(movieID) + getVideoUrl)!
        print("Movie URL GET Request \(fullUrl)" )


        let request = URLRequest(url: fullUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                
                self.movieData = dataDictionary["results"] as! [[String:Any]]
                
                self.key = self.movieData[1]["key"] as! String
                print(self.key)
                
                let myURL = URL(string:"https://www.youtube.com/watch?v=\(self.key)")
                let myRequest = URLRequest(url: myURL!)
                self.trailerWebView.load(myRequest)
                
                }
            
                
        }
        task.resume()
                
                
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
