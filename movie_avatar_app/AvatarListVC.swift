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
        title  = "'Inception' Characters!"
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
        
        return cell
    }
    
}

extension AvatarListVC{
    
    func fetch() -> [Avatar]{
        
        let img1  = Avatar(image: Images.ariadne, label:"Ariadne" )
        let img2  = Avatar(image: Images.arthur, label:"Arthur" )
        let img3  = Avatar(image: Images.eames, label:"Eames" )
        let img4  = Avatar(image: Images.fischer, label:"Fischer" )
        let img5  = Avatar(image: Images.mal, label:"Mal" )
        let img6  = Avatar(image: Images.saito, label:"Saito" )
        let img7  = Avatar(image: Images.miles, label:"Prof. Stephen Miles" )
        let img8  = Avatar(image: Images.maurice, label:"Maurice Fisher" )
        let img9  = Avatar(image: Images.browning, label:"Browning" )
        let img10  = Avatar(image: Images.phillipa, label:"Phillipa" )
        let img11  = Avatar(image: Images.thin_man, label:"Thin Man" )
        
        return [img1, img2, img3, img4, img5, img6,img7,img8, img9,img10,img11]
    }
}
