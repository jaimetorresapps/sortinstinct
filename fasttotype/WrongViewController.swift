//
//  WrongViewController.swift
//  fasttotype
//
//  Created by Jaime on 7/23/19.
//  Copyright © 2019 Jaime. All rights reserved.
//

import UIKit

class WrongViewController: UIViewController {

    @IBOutlet weak var btnTryAgain: UIButton!
    var loseMessage:String?
    var wordScore:Int?
    var gameType:String?
    var playtime:Double?
    var playingtime:String?
    var currentscore:Int?
    
    @IBOutlet weak var messageHeight: NSLayoutConstraint!
    @IBOutlet weak var tryAgainHeight: NSLayoutConstraint!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnTryAgain.layer.cornerRadius = 10
        
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
        
        if(gameType == "tw")
        {
            self.lblScore.text = String(format:"words:%d    time per word:%.1f    playing time:%@",wordScore!,playtime!,playingtime!)
        }
        else
        {
            playtime = playtime! / 60
            self.lblScore.text = String(format:"words:%d    playing time:%.1f minute(s)",wordScore!,playtime!)
        }
        
        let scorekey = String(format:"hs%@%.1f",gameType!,playtime!)
        
        print(String(format:"scorekey:%@",scorekey))
        currentscore = UserDefaults.standard.integer(forKey: scorekey)
        
        if(currentscore == nil)
        {
            UserDefaults.standard.set(wordScore, forKey: scorekey)
        }
        else
        {
            if(wordScore! > currentscore!)
            {
                UserDefaults.standard.set(wordScore, forKey: scorekey)
                
                if(gameType == "tw")
                {
                    let ptimekey = String(format:"pt%.1f",playtime!)
                    UserDefaults.standard.set(playingtime, forKey: ptimekey)
                }

                self.lblMessage.text = "new high score"
            }
        }
        
        if(wordScore! <= currentscore!)
        {
            self.lblMessage.text = self.loseMessage
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    
    @IBAction func tryAgain(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func changeUI(uiH:CGFloat,uiF:CGFloat)
    {
        messageHeight.constant = uiH
        tryAgainHeight.constant = uiH
        lblMessage.font = .systemFont(ofSize: uiF)
        btnTryAgain.titleLabel?.font = .systemFont(ofSize: uiF)
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
