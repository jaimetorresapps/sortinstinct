//
//  ScoresViewController.swift
//  fasttotype
//
//  Created by Jaime on 7/30/19.
//  Copyright © 2019 Jaime. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController {

    @IBOutlet weak var lbltt1: UILabel!
    @IBOutlet weak var lbltt2: UILabel!
    @IBOutlet weak var lbltt3: UILabel!
    @IBOutlet weak var lbltt4: UILabel!
    @IBOutlet weak var lbltt5: UILabel!
    
    @IBOutlet weak var lbltw3: UILabel!
    @IBOutlet weak var lbltw25: UILabel!
    @IBOutlet weak var lbltw2: UILabel!
    @IBOutlet weak var lbltw15: UILabel!
    @IBOutlet weak var lbltw1: UILabel!
    
    @IBOutlet weak var playintimetw3: UILabel!
    @IBOutlet weak var playintimetw25: UILabel!
    @IBOutlet weak var playintimetw2: UILabel!
    @IBOutlet weak var playintimetw15: UILabel!
    @IBOutlet weak var playintimetw1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tw3 = String(format:"hstw3.0")
        let tw25 = String(format:"hstw2.5")
        let tw2 = String(format:"hstw2.0")
        let tw15 = String(format:"hstw1.5")
        let tw1 = String(format:"hstw1.0")
        
        let tt1 = String(format:"hstt1.0")
        let tt2 = String(format:"hstt2.0")
        let tt3 = String(format:"hstt3.0")
        let tt4 = String(format:"hstt4.0")
        let tt5 = String(format:"hstt5.0")
        
        let pt3 = String(format:"pt3.0")
        let pt25 = String(format:"pt2.5")
        let pt2 = String(format:"pt2.0")
        let pt15 = String(format:"pt1.5")
        let pt1 = String(format:"pt1.0")
        
        lbltt1.text = UserDefaults.standard.string(forKey: tt1)
        lbltt2.text = UserDefaults.standard.string(forKey: tt2)
        lbltt3.text = UserDefaults.standard.string(forKey: tt3)
        lbltt4.text = UserDefaults.standard.string(forKey: tt4)
        lbltt5.text = UserDefaults.standard.string(forKey: tt5)
        
        lbltw3.text = UserDefaults.standard.string(forKey: tw3)
        lbltw25.text = UserDefaults.standard.string(forKey: tw25)
        lbltw2.text = UserDefaults.standard.string(forKey: tw2)
        lbltw15.text = UserDefaults.standard.string(forKey: tw15)
        lbltw1.text = UserDefaults.standard.string(forKey: tw1)
        
        playintimetw3.text = UserDefaults.standard.string(forKey: pt3)
        playintimetw25.text = UserDefaults.standard.string(forKey: pt25)
        playintimetw2.text = UserDefaults.standard.string(forKey: pt2)
        playintimetw15.text = UserDefaults.standard.string(forKey: pt15)
        playintimetw1.text = UserDefaults.standard.string(forKey: pt1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }

    @IBAction func doneScores(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
      
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
