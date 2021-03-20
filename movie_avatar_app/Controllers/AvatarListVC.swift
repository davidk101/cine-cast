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
    var filteredAvatars: [Avatar] = []
    let searchController = UISearchController(searchResultsController: nil)
    var currentRow: Int = 0 // must be init to 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        
        self.tableView.backgroundColor = UIColor(red: 193/255.0, green: 225/255.0, blue: 236/255.0, alpha: 1.0)
        title  = "Inception"
        avatars = fetch()
        configureTableView()
        configureSearchBar()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "fromAPI"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "fromVC"), object: nil)
        
    }
    
    func configureTableView(){
        
        view.addSubview(tableView)
        
        setTableViewDelegates()
        tableView.rowHeight = 150
        tableView.register(AvatarCell.self, forCellReuseIdentifier: "AvatarCell")
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates(){
        
        // self ->  AvatarListVC
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func configureSearchBar(){
        
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false  // select cell during search 
        filteredAvatars = avatars
    }

}

extension AvatarListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredAvatars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell") as! AvatarCell
        let avatar  = filteredAvatars[indexPath.row]

        cell.setCell(avatar: avatar)
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        let destination = AvatarVC()
        navigationController?.pushViewController(destination, animated: true)
        
        destination.label.text = filteredAvatars[indexPath.row].label
        destination.imageView.image = filteredAvatars[indexPath.row].image
        destination.rowNumber = indexPath.row
 
        tableView.deselectRow(at: indexPath, animated: true)
                
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "fromVC"), object: indexPath.row)
        
    }
}

extension AvatarListVC{
    
    func fetch() -> [Avatar]{
        
        let img1  = Avatar(image: Images.ariadne, label:"Ariadne", id: "27578" )
        let img2  = Avatar(image: Images.arthur, label:"Arthur", id:"24045"   )
        let img3  = Avatar(image: Images.eames, label:"Eames", id:"2524"  )
        let img4  = Avatar(image: Images.fischer, label:"Robert Fischer", id: "2037"   )
        let img5  = Avatar(image: Images.mal, label:"Mal Cobb", id: "8293"   )
        let img6  = Avatar(image: Images.saito, label:"Saito", id: "3899"   )
        let img7  = Avatar(image: Images.miles, label:"Prof. Stephen Miles", id:"3895"    )
        let img8  = Avatar(image: Images.maurice, label:"Maurice Fischer", id: "4935"   )
        let img9  = Avatar(image: Images.browning, label:"Browning", id: "13022"   )
        let img10  = Avatar(image: Images.cobb, label:"Dom Cobb", id: "6193"   )

        return [img1, img2, img3, img4, img5, img6,img7,img8, img9,img10]
    }
    
}

extension AvatarListVC: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredAvatars = []
        
        if searchText == ""{
            
            filteredAvatars = avatars
        }
        else{
            
            for avatar in avatars{
                if avatar.label.lowercased().contains(searchText.lowercased()){
                    filteredAvatars.append(avatar)
                }
            }
        }

        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        filteredAvatars = []
        filteredAvatars = avatars
        self.tableView.reloadData()
                
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) { // persist text in search bar 
        
    }
    
}
