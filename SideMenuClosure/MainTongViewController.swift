//
//  MainTongViewController.swift
//  SideMenuClosure
//
//  Created by Boss on 5/14/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class MainTongViewController: UIViewController, Slide {
    
    
    @IBOutlet weak var homeContainerView: UIView!
    @IBOutlet weak var CoverButton: UIButton!
    @IBOutlet weak var sideContainerView: UIView!
    // dieu khien thang leading de dong mo hop
    @IBOutlet weak var leadingSideMenu: NSLayoutConstraint!
    // 1 cai bien de kiem soat
    var showing: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.35, animations: {
                self.leadingSideMenu.constant = self.showing ? 0 : -self.sideContainerView.bounds.width
                self.view.layoutIfNeeded()
            })
        }
    }
    var homevc: HomeViewController?
    var sidevc: SideViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showing = true
        sidevc?.myClosure = homevc?.data
        // Do any additional setup after loading the view.
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Home":
        guard let navigationController = segue.destination as? UINavigationController else {return}
         homevc = navigationController.topViewController as? HomeViewController
        case "Side":
            sidevc = segue.destination as? SideViewController
                sidevc?.dongmenu = self
        default:
            return
        }
    }
    @IBAction func ClickButton(_ sender: Any) {
        showing = !showing
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
