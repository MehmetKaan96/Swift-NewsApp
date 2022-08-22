//
//  ViewController.swift
//  NewsAPI
//
//  Created by Mehmet on 13.08.2022.
//

import UIKit
import SideMenu

class ViewController: UITableViewController, UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 0{
            filteredNews = news.filter {
                $0.title!.contains(text)
            }
        }else{
            filteredNews = news
        }
        tableView.reloadData()
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    var menu = SideMenuNavigationController(rootViewController: MenuListController())
    var news = [Article]()
    
    var filteredNews = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        menu.leftSide = true
        menu.navigationBar.backgroundColor = .red
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Write something to find"
        navigationItem.searchController = searchController
        searchController.searchBar.backgroundColor = .white
        definesPresentationContext = true
        
        
        SideMenuManager.default.leftMenuNavigationController = menu
        //        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        navigationController?.navigationBar.backgroundColor = .red
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=355e0ae5c4d342d1862ecd691fa12300")!
        let data = try! Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        let downloadedData = try! decoder.decode(ArticleResponse.self, from: data)
        self.news = downloadedData.articles
        self.filteredNews = downloadedData.articles
        print(self.news)
        
    }
    
    @IBAction func menuButtonTapped(_ sender: UIBarButtonItem) {
        present(menu, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.filteredNews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        let datas = self.filteredNews[indexPath.row]
        
        if let url = URL(string: datas.urlToImage ?? ""){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil && data != nil{
                    do{
                        DispatchQueue.main.async {
                            cell.newsImage.image = UIImage(data: data!)
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }else{
            print("Error")
        }
        
        
        
        cell.titleLabel.text = datas.title
        cell.contentLabel.text = datas.content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.selectedNews = news[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

