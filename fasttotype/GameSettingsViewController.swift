//
//  GameSettingsViewController.swift
//  fasttotype
//
//  Created by Jaime on 7/30/19.
//  Copyright © 2019 Jaime. All rights reserved.
//
//
//
//

import UIKit

class GameSettingsViewController: UIViewController {
    
    @IBOutlet weak var tw10: UIButton!
    @IBOutlet weak var tw7: UIButton!
    @IBOutlet weak var tw5: UIButton!
    @IBOutlet weak var tw4: UIButton!
    @IBOutlet weak var tw2: UIButton!
    
    @IBOutlet weak var tt1: UIButton!
    @IBOutlet weak var tt2: UIButton!
    @IBOutlet weak var tt3: UIButton!
    @IBOutlet weak var tt4: UIButton!
    @IBOutlet weak var tt5: UIButton!
    
    @IBOutlet weak var gameHeight1: NSLayoutConstraint!
    @IBOutlet weak var gameHeight2: NSLayoutConstraint!
    @IBOutlet weak var gameHeight3: NSLayoutConstraint!
    @IBOutlet weak var gameHeight4: NSLayoutConstraint!
    @IBOutlet weak var gameHeight5: NSLayoutConstraint!
    
    @IBOutlet weak var wordHeight: NSLayoutConstraint!
    @IBOutlet weak var wordHeight2: NSLayoutConstraint!
    @IBOutlet weak var wordHeight3: NSLayoutConstraint!
    @IBOutlet weak var wordHeight4: NSLayoutConstraint!
    @IBOutlet weak var wordHeight5: NSLayoutConstraint!
    
    var languageArray = ["English","Spanish"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deviceW = UIScreen.main.bounds.width
        let deviceH = UIScreen.main.bounds.height
        
        if(UIScreen.main.traitCollection.userInterfaceIdiom == .pad)
        {
            self.changeUI(uiH: 189.5, uiF: 55.0)
        }
        else
        {
            if(deviceW == 736.0 && deviceH == 414.0)
            {
                 self.changeUI(uiH: 95, uiF: 35.0)
            }
            else if(deviceW == 667.0 && deviceH == 375.0)
            {
                 self.changeUI(uiH: 95, uiF: 35.0)
            }
            else if(deviceW == 568.0 && deviceH == 320.0)
            {
                 self.changeUI(uiH: 70, uiF: 30.0)
            }
            else if(deviceW == 812.0 && deviceH == 375.0)
            {
                 self.changeUI(uiH: 80, uiF: 30.0)
            }
            else
            {
                self.changeUI(uiH: 95, uiF: 35.0)
            }
        }
        
        let gameType = UserDefaults.standard.string(forKey: "gameType") ?? "tw"
        
        var tw = UserDefaults.standard.double(forKey: "tw")
        
        
        if(UserDefaults.standard.object(forKey: "tw") == nil)
        {
            tw = 2.0
        }
        
        var tt = UserDefaults.standard.double(forKey: "tt")
        if(UserDefaults.standard.object(forKey: "tt") == nil)
        {
            tt = 1.0
        }
        
        if(gameType == "tw")
        {
            switch(tw)
            {
                case 3:tw10.backgroundColor = UIColor.orange
                case 2.5:tw7.backgroundColor = UIColor.orange
                case 2:tw5.backgroundColor = UIColor.orange
                case 1.5:tw4.backgroundColor = UIColor.orange
                case 1:tw2.backgroundColor = UIColor.orange
                default:tw5.backgroundColor = UIColor.orange
            }
        }
        else
        {
            switch(tt)
            {
                case 1.0:tt1.backgroundColor = UIColor.orange
                case 2.0:tt2.backgroundColor = UIColor.orange
                case 3.0:tt3.backgroundColor = UIColor.orange
                case 4.0:tt4.backgroundColor = UIColor.orange
                case 5.0:tt5.backgroundColor = UIColor.orange
                default:tt1.backgroundColor = UIColor.orange
            }
        }
        
        tw10.layer.cornerRadius = 10
        tw7.layer.cornerRadius = 10
        tw5.layer.cornerRadius = 10
        tw4.layer.cornerRadius = 10
        tw2.layer.cornerRadius = 10
        tt1.layer.cornerRadius = 10
        tt2.layer.cornerRadius = 10
        tt3.layer.cornerRadius = 10
        tt4.layer.cornerRadius = 10
        tt5.layer.cornerRadius = 10
        
    }
    
    func changeUI(uiH:CGFloat,uiF:CGFloat)
    {
        gameHeight1.constant = uiH
        wordHeight.constant = uiH
        tt1.titleLabel?.font = .systemFont(ofSize: uiF)
        tw10.titleLabel?.font = .systemFont(ofSize: uiF)
        
        gameHeight2.constant = uiH
        wordHeight2.constant = uiH
        tt2.titleLabel?.font = .systemFont(ofSize: uiF)
        tw7.titleLabel?.font = .systemFont(ofSize: uiF)
        
        gameHeight3.constant = uiH
        wordHeight3.constant = uiH
        tt3.titleLabel?.font = .systemFont(ofSize: uiF)
        tw5.titleLabel?.font = .systemFont(ofSize: uiF)
        
        gameHeight4.constant = uiH
        wordHeight4.constant = uiH
        tt4.titleLabel?.font = .systemFont(ofSize: uiF)
        tw4.titleLabel?.font = .systemFont(ofSize: uiF)
        
        gameHeight5.constant = uiH
        wordHeight5.constant = uiH
        tt5.titleLabel?.font = .systemFont(ofSize: uiF)
        tw2.titleLabel?.font = .systemFont(ofSize: uiF)
    }
    
    func resetColors()
    {
        tw10.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
        tw7.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
        tw5.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
        tw4.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
        tw2.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
        tt1.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
        tt2.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
        tt3.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
        tt4.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
        tt5.backgroundColor = UIColor(red: CGFloat(249.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1)
    }
    
    @IBAction func tw10(_ sender: Any) {
        UserDefaults.standard.set(3.0, forKey: "tw")
        UserDefaults.standard.set("tw", forKey: "gameType")
        
        self.resetColors()
        tw10.backgroundColor = UIColor.orange
    }
    
    @IBAction func tw7(_ sender: Any) {
        UserDefaults.standard.set(2.5, forKey: "tw")
        UserDefaults.standard.set("tw", forKey: "gameType")
        
        self.resetColors()
        tw7.backgroundColor = UIColor.orange
    }
    
    @IBAction func tw5(_ sender: Any) {
        UserDefaults.standard.set(2.0, forKey: "tw")
        UserDefaults.standard.set("tw", forKey: "gameType")
        
        self.resetColors()
        tw5.backgroundColor = UIColor.orange
    }
    
    @IBAction func tw4(_ sender: Any) {
        UserDefaults.standard.set(1.5, forKey: "tw")
        UserDefaults.standard.set("tw", forKey: "gameType")
        
        self.resetColors()
        tw4.backgroundColor = UIColor.orange
    }
    
    @IBAction func tw2(_ sender: Any) {
        UserDefaults.standard.set(1.0, forKey: "tw")
        UserDefaults.standard.set("tw", forKey: "gameType")
        
        self.resetColors()
        tw2.backgroundColor = UIColor.orange
    }
    
    @IBAction func tt1(_ sender: Any) {
        UserDefaults.standard.set(1.0, forKey: "tt")
        UserDefaults.standard.set("tt", forKey: "gameType")
        
        self.resetColors()
        tt1.backgroundColor = UIColor.orange
    }
    
    @IBAction func tt2(_ sender: Any) {
        UserDefaults.standard.set(2.0, forKey: "tt")
        UserDefaults.standard.set("tt", forKey: "gameType")
        
        self.resetColors()
        tt2.backgroundColor = UIColor.orange
    }
    
    @IBAction func tt3(_ sender: Any) {
        UserDefaults.standard.set(3.0, forKey: "tt")
        UserDefaults.standard.set("tt", forKey: "gameType")
        
        self.resetColors()
        tt3.backgroundColor = UIColor.orange
    }
    
    @IBAction func tt4(_ sender: Any) {
        UserDefaults.standard.set(4.0, forKey: "tt")
        UserDefaults.standard.set("tt", forKey: "gameType")
        
        self.resetColors()
        tt4.backgroundColor = UIColor.orange
    }
    
    @IBAction func tt5(_ sender: Any) {
        UserDefaults.standard.set(5.0, forKey: "tt")
        UserDefaults.standard.set("tt", forKey: "gameType")
        
        self.resetColors()
        tt5.backgroundColor = UIColor.orange
    }
    
    @IBAction func doneSettings(_ sender: Any) {
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
