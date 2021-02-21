//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by Paul Newling on 2/15/21.
//  Copyright © 2021 Paul Newling. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var trailerButton: UIButton!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let basePosterURL = "https://image.tmdb.org/t/p/w185"
        let posterpath = movie["poster_path"] as! String
        let posterURL = URL(string: basePosterURL + posterpath)
        
        posterView.af_setImage(withURL: posterURL!)
        
        let baseBackdropURL = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: baseBackdropURL + backdropPath)
        
        backdropView.af_setImage(withURL: backdropURL!)
        
    }
    
    

    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Find selected movie
        let movieID = movie["id"]
//        let baseUrl = "https://api.themoviedb.org/3/movie/"
//        let getVideoUrl = "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"
//        let fullUrl = URL(string: baseUrl + movieID + getVideoUrl)
//        print("Movie URL GET Request \(fullUrl)" )
        
        
        
        
        // Pass selected movie to details view controller
        
        let trailerViewController = segue.destination as! TrailerViewController
        
        trailerViewController.movieID = movieID as! Int
        
        
        
    }
    
    

}
