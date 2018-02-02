//
//  ViewController.swift
//  Simpsons Book
//
//  Created by Adolfo Lozano Mendez on 28/09/17.
//  Copyright © 2017 Adolfo Lozano Mendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mTableView: UITableView!
    
    var mSimpsonList = [Simpson]()
    var selectedSimpson = Simpson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mTableView.delegate = self
        mTableView.dataSource = self

        
        
        
        let homer = Simpson()
        homer.name = "Homero Simpson"
        homer.ocupation = "Inspector de Seguridad"
        print("image seting")
        if let image = UIImage(named: "homersimpson.png") {
            homer.image = image
            print("image set")
        }else {
            print("image no set")
        }
        
        let marge = Simpson()
        marge.name = "Marge Simpson"
        marge.ocupation = "Ama de Casa"
        marge.image = UIImage(named: "marge.jpg")!
        
        let burns = Simpson()
        burns.name = "Montgomery (Monty) Burns"
        burns.ocupation = "Dueño de la planta nuclear de Spingfield"
        burns.image = UIImage(named: "burns.jpg")!
        
        mSimpsonList.append(homer)
        mSimpsonList.append(marge)
        mSimpsonList.append(burns)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mSimpsonList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mSimpsonList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSimpson = mSimpsonList[indexPath.row]
        self.performSegue(withIdentifier: "showDetailVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetailVC"){
            let destination = segue.destination as! DetailViewController
            destination.simpson = selectedSimpson
        }
    }

}

