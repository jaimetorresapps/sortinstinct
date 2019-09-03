//
//  MainViewController.swift
//  fasttotype
//
//  Created by Jaime on 7/30/19.
//  Copyright © 2019 Jaime. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnStart.layer.cornerRadius = 10

       let deviceW = UIScreen.main.bounds.width
       let deviceH = UIScreen.main.bounds.height
        
       if(UIScreen.main.traitCollection.userInterfaceIdiom == .pad)
       {
            self.changeUI(uiH: 189.5, uiF: 100.0)
       }
       else
       {
            if(deviceW == 736.0 && deviceH == 414.0)
            {
                self.changeUI(uiH: 132, uiF: 100.0)
            }
            else if(deviceW == 667.0 && deviceH == 375.0)
            {
                self.changeUI(uiH: 120, uiF: 90.0)
            }
            else if(deviceW == 568.0 && deviceH == 320.0)
            {
                self.changeUI(uiH: 95, uiF: 80.0)
            }
            else if(deviceW == 812.0 && deviceH == 375.0)
            {
                self.changeUI(uiH: 110, uiF: 85.0)
            }
            else
            {
                self.changeUI(uiH: 132, uiF: 100.0)
            }
        }
    }
    
    func changeUI(uiH:CGFloat,uiF:CGFloat){
        titleHeight.constant = uiH
        buttonHeight.constant = uiH
        lblTitle.font = .systemFont(ofSize: uiF)
        btnStart.titleLabel?.font = .systemFont(ofSize: uiF)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
