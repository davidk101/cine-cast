//
//  AvatarVC.swift
//  movie_avatar_app
//
//  Created by David Kumar on 3/18/21.
//  Copyright © 2021 David Kumar. All rights reserved.
//

import UIKit

class AvatarVC: UIViewController{
    
    var network = NetworkCall()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        network.getData(id: "287")
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceivedFromVC(notification:)), name: NSNotification.Name(rawValue: "fromVC"), object: nil)
                
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceivedFromAPI(notification:)), name: NSNotification.Name(rawValue: "fromAPI"), object: nil)
        

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(popVC(sender:)))
        
        self.navigationItem.leftBarButtonItem?.tintColor = .black
                
        view.backgroundColor = UIColor(red: 193/255.0, green: 225/255.0, blue: 236/255.0, alpha: 1.0)
        
        view.addSubview(imageView)
        imageConstraints()
        
        view.addSubview(label)
        labelConstraints()
        
    }
    
    @objc func notificationReceivedFromAPI(notification: Notification) {
        
        let data = notification.object as! String
        
        print(data)
        
        label.text = data
        
    }
    
    @objc func notificationReceivedFromVC(notification: Notification) {
        let data = notification.object
        print(data as Any)
    }

    @objc func popVC(sender: UIBarButtonItem){
        
        navigationController?.popViewController(animated: true)
    }
    
    let imageView: UIImageView = {
        
        let image = UIImageView()
        return image
        
    }() // the result of closure goes into the imageView
    
    let label : UILabel = {
        
        //let label = UILabel()
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0 // word-wrap
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.backgroundColor = .cyan
        label.textAlignment = .center
        label.sizeToFit()
        return label
        
    }()
    
    func labelConstraints(){
        /*
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 300).isActive = true*/
    }
    
    func imageConstraints(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
        
        imageView.layer.masksToBounds = true // sublayer clipped to layer's bounds
        imageView.layer.cornerRadius = 15
        
    }
    
}
