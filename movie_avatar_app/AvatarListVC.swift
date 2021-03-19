//
//  AvatarListVC.swift
//  movie_avatar_app
//
//  Created by David Kumar on 3/18/21.
//  Copyright © 2021 David Kumar. All rights reserved.
//

import UIKit

class AvatarListVC: UIViewController {
    
    var tableView = UITableView()
    var avatars : [Avatar] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "Inception Character List!"
        avatars = fetch()
        configureTableView()

    }
    
    func configureTableView(){
        
        view.addSubview(tableView)
        
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(AvatarCell.self, forCellReuseIdentifier: "AvatarCell")
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates(){
        
        // self ->  AvatarListVC
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension AvatarListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return avatars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell") as! AvatarCell
        
        let avatar  = avatars[indexPath.row]
        
        cell.identifyCell(avatar: avatar)
        
        return UITableViewCell()
    }
    
    
    
}

extension AvatarListVC{
    
    func fetch() -> [Avatar]{
        
        let img1  = Avatar(image: Images.ariadne, label:"" )
        let img2  = Avatar(image: Images.arthur, label:"" )
        let img3  = Avatar(image: Images.eames, label:"" )
        let img4  = Avatar(image: Images.fischer, label:"" )
        let img5  = Avatar(image: Images.mal, label:"" )
        let img6  = Avatar(image: Images.saito, label:"" )
        
        return [img1, img2, img3, img4, img5, img6]
    }
}
