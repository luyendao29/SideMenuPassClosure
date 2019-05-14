//
//  HomeViewController.swift
//  SideMenuClosure
//
//  Created by Boss on 5/14/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit
protocol Slide {
    var showing: Bool {get set}
}
class HomeViewController: UIViewController {
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var labelage: UILabel!
 
    var delegate: Slide?
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupAvatarImage()
        // Do any additional setup after loading the view.
    }
    func data(_ person: Person?) {
        images.image = person?.image
        labelname.text = person?.name
        labelage.text = person?.age
    }
    private func setupAvatarImage() {
        images.layer.cornerRadius = images.bounds.height / 2
    }
    
    @IBAction func ClickMenu(_ sender: Any) {
        delegate?.showing = true
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
