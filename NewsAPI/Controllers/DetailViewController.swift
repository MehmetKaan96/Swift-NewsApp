//
//  DetailViewController.swift
//  NewsAPI
//
//  Created by Mehmet on 15.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedNews: Article?

    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    
    @IBOutlet var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = selectedNews?.title
        
        authorLabel.text = "By \(selectedNews!.author!)"
        titleLabel.text = selectedNews?.title
        sourceLabel.text = "Source: \(selectedNews!.source.name)"
        contentLabel.text = selectedNews?.content
        
        if let url = URL(string: selectedNews?.urlToImage ?? " "){
            do{
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if error == nil && data != nil{
                        DispatchQueue.main.async {
                            self.articleImageView.image = UIImage(data: data!)
                        }
                    }else{
                        print(error?.localizedDescription)
                    }
                }.resume()
            }catch{
                print("Error")
            }
        }
    }

}
