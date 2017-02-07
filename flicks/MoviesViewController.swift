//
//  ViewController.swift
//  flicks
//
//  Created by fer on 1/31/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var movieTable: UITableView!
    var movies : [NSDictionary] = []
    
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        //MBProgressHUD.showAdded(to: self.view, animated: true)
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    self.movies = dataDictionary["results"] as! [NSDictionary]
                    self.movieTable.reloadData()
                }
            }
            //MBProgressHUD.hide(for: self.view, animated: true)
            refreshControl.endRefreshing()
        }
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: .valueChanged)
        
        // add refresh control to table view
        movieTable.insertSubview(refreshControl, at: 0)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        movieTable.delegate = self
        movieTable.dataSource = self
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    self.movies = dataDictionary["results"] as! [NSDictionary]
                    self.movieTable.reloadData()
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            //refreshControl.endRefreshing()
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        
        let title = movie["title"] as! String
        
        let overview = movie["overview"] as! String
        
        let fp = "https://image.tmdb.org/t/p/w500/"
        
        let lp = movie["poster_path"] as! String
        
        let moviePoster = NSURL(string: fp + lp)
        
        cell.movieCTitle.text = "\(title)"
        
        cell.movieCOverview.text = "\(overview)"
        
        cell.movieCPoster.setImageWith(moviePoster as! URL)
        
        return cell
    }
}

