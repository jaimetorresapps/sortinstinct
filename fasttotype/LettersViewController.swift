//
//  LettersViewController.swift
//  fasttotype
//
//  Created by Jaime on 7/21/19.
//  Copyright © 2019 Jaime. All rights reserved.
//

import UIKit

class LettersViewController: UIViewController {
    
    weak var playingtimer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    var status: Bool = false
    
    var restarttimer:Bool?
    
    @IBOutlet weak var labelMinute: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelMillisecond: UILabel!
    @IBOutlet weak var letterHeight1: NSLayoutConstraint!
    @IBOutlet weak var letterHeight2: NSLayoutConstraint!
    @IBOutlet weak var letterHeight3: NSLayoutConstraint!
    @IBOutlet weak var letterHeight4: NSLayoutConstraint!
    @IBOutlet weak var letterHeight5: NSLayoutConstraint!
    @IBOutlet weak var shuffledHeight1: NSLayoutConstraint!
    @IBOutlet weak var shuffledHeight2: NSLayoutConstraint!
    @IBOutlet weak var shuffledHeight3: NSLayoutConstraint!
    @IBOutlet weak var shuffledHeight4: NSLayoutConstraint!
    @IBOutlet weak var shuffledHeight5: NSLayoutConstraint!
    @IBOutlet weak var lblPlayingType: UILabel!
    @IBOutlet weak var lblTimeSpeed: UILabel!
    @IBOutlet weak var gameTypeBackground: UILabel!
    @IBOutlet weak var timeBackground: UILabel!
    @IBOutlet weak var lblWordCount: UILabel!
    @IBOutlet weak var btnRandom5: UIButton!
    @IBOutlet weak var btnRandom4: UIButton!
    @IBOutlet weak var btnRandom3: UIButton!
    @IBOutlet weak var btnRandom2: UIButton!
    @IBOutlet weak var btnRandom1: UIButton!
    @IBOutlet weak var lblWL1: UILabel!
    @IBOutlet weak var lblWL2: UILabel!
    @IBOutlet weak var lblWL3: UILabel!
    @IBOutlet weak var lblWL4: UILabel!
    @IBOutlet weak var lblWL5: UILabel!
    
    var selLetterIndex = 0
    var normalWordArray = [String]()
    var wordArray = [String]()
    var wordCount = 0
    var loseMessage:String?
    var timer:Timer?
    var timeQty:Int?
    var ptime:Double?
    var gameType:String?
    var timerInterval:Double?
    
    var arrayOfWords = ["about",
                        "above",
                        "abuse",
                        "actor",
                        "acute",
                        "admit",
                        "adopt",
                        "adult",
                        "after",
                        "again",
                        "agent",
                        "agree",
                        "ahead",
                        "alarm",
                        "album",
                        "alert",
                        "alike",
                        "alive",
                        "allow",
                        "alone",
                        "along",
                        "alter",
                        "among",
                        "anger",
                        "Angle",
                        "angry",
                        "apart",
                        "apple",
                        "apply",
                        "arena",
                        "argue",
                        "arise",
                        "array",
                        "aside",
                        "asset",
                        "audio",
                        "audit",
                        "avoid",
                        "award",
                        "aware",
                        "badly",
                        "baker",
                        "bases",
                        "basic",
                        "basis",
                        "beach",
                        "began",
                        "begin",
                        "begun",
                        "being",
                        "below",
                        "bench",
                        "billy",
                        "birth",
                        "black",
                        "blame",
                        "blind",
                        "block",
                        "blood",
                        "board",
                        "boost",
                        "booth",
                        "bound",
                        "brain",
                        "brand",
                        "bread",
                        "break",
                        "breed",
                        "brief",
                        "bring",
                        "broad",
                        "broke",
                        "brown",
                        "build",
                        "built",
                        "buyer",
                        "cable",
                        "calif",
                        "carry",
                        "catch",
                        "cause",
                        "chain",
                        "chair",
                        "chart",
                        "chase",
                        "cheap",
                        "check",
                        "chest",
                        "chief",
                        "child",
                        "china",
                        "chose",
                        "civil",
                        "claim",
                        "class",
                        "clean",
                        "clear",
                        "click",
                        "clock",
                        "close",
                        "coach",
                        "coast",
                        "could",
                        "count",
                        "court",
                        "cover",
                        "craft",
                        "crash",
                        "cream",
                        "crime",
                        "cross",
                        "crowd",
                        "crown",
                        "curve",
                        "cycle",
                        "daily",
                        "dance",
                        "dated",
                        "dealt",
                        "death",
                        "debut",
                        "delay",
                        "depth",
                        "doing",
                        "doubt",
                        "dozen",
                        "draft",
                        "drama",
                        "drawn",
                        "dream",
                        "dress",
                        "drill",
                        "drink",
                        "drive",
                        "drove",
                        "dying",
                        "eager",
                        "early",
                        "earth",
                        "eight",
                        "elite",
                        "empty",
                        "enemy",
                        "enjoy",
                        "enter",
                        "entry",
                        "equal",
                        "error",
                        "event",
                        "every",
                        "exact",
                        "exist",
                        "extra",
                        "faith",
                        "false",
                        "fault",
                        "fiber",
                        "field",
                        "fifth",
                        "fifty",
                        "fight",
                        "final",
                        "first",
                        "fixed",
                        "flash",
                        "fleet",
                        "floor",
                        "fluid",
                        "focus",
                        "force",
                        "forth",
                        "forty",
                        "forum",
                        "found",
                        "frame",
                        "frank",
                        "fraud",
                        "fresh",
                        "front",
                        "fruit",
                        "fully",
                        "funny",
                        "giant",
                        "given",
                        "glass",
                        "globe",
                        "going",
                        "grace",
                        "grade",
                        "grand",
                        "grant",
                        "grass",
                        "great",
                        "green",
                        "gross",
                        "group",
                        "grown",
                        "guard",
                        "guess",
                        "guest",
                        "guide",
                        "happy",
                        "harry",
                        "heart",
                        "heavy",
                        "hence",
                        "henry",
                        "horse",
                        "hotel",
                        "house",
                        "human",
                        "ideal",
                        "image",
                        "index",
                        "inner",
                        "input",
                        "issue",
                        "japan",
                        "jimmy",
                        "joint",
                        "jones",
                        "judge",
                        "known",
                        "label",
                        "large",
                        "laser",
                        "later",
                        "laugh",
                        "layer",
                        "learn",
                        "lease",
                        "least",
                        "leave",
                        "legal",
                        "level",
                        "lewis",
                        "light",
                        "limit",
                        "links",
                        "lives",
                        "local",
                        "logic",
                        "loose",
                        "lower",
                        "lucky",
                        "lunch",
                        "lying",
                        "magic",
                        "major",
                        "maker",
                        "march",
                        "maria",
                        "match",
                        "maybe",
                        "mayor",
                        "meant",
                        "media",
                        "metal",
                        "might",
                        "minor",
                        "minus",
                        "mixed",
                        "model",
                        "money",
                        "month",
                        "moral",
                        "motor",
                        "mount",
                        "mouse",
                        "mouth",
                        "movie",
                        "music",
                        "needs",
                        "never",
                        "newly",
                        "night",
                        "noise",
                        "north",
                        "noted",
                        "novel",
                        "nurse",
                        "occur",
                        "ocean",
                        "offer",
                        "often",
                        "order",
                        "other",
                        "ought",
                        "paint",
                        "panel",
                        "paper",
                        "party",
                        "peace",
                        "peter",
                        "phase",
                        "phone",
                        "photo",
                        "piece",
                        "pilot",
                        "pitch",
                        "place",
                        "plain",
                        "plane",
                        "plant",
                        "plate",
                        "point",
                        "pound",
                        "power",
                        "press",
                        "price",
                        "pride",
                        "prime",
                        "print",
                        "prior",
                        "prize",
                        "proof",
                        "proud",
                        "prove",
                        "queen",
                        "quick",
                        "quiet",
                        "quite",
                        "radio",
                        "raise",
                        "range",
                        "rapid",
                        "ratio",
                        "reach",
                        "ready",
                        "refer",
                        "right",
                        "rival",
                        "river",
                        "robin",
                        "roger",
                        "roman",
                        "rough",
                        "round",
                        "route",
                        "royal",
                        "rural",
                        "scale",
                        "scene",
                        "scope",
                        "score",
                        "sense",
                        "serve",
                        "seven",
                        "shall",
                        "shape",
                        "share",
                        "sharp",
                        "sheet",
                        "shelf",
                        "shell",
                        "shift",
                        "shirt",
                        "shock",
                        "shoot",
                        "short",
                        "shown",
                        "sight",
                        "since",
                        "sixth",
                        "sixty",
                        "sized",
                        "skill",
                        "sleep",
                        "slide",
                        "small",
                        "smart",
                        "smile",
                        "smith",
                        "smoke",
                        "solid",
                        "solve",
                        "sorry",
                        "sound",
                        "south",
                        "space",
                        "spare",
                        "speak",
                        "speed",
                        "spend",
                        "spent",
                        "split",
                        "spoke",
                        "sport",
                        "staff",
                        "stage",
                        "stake",
                        "stand",
                        "start",
                        "state",
                        "steam",
                        "steel",
                        "stick",
                        "still",
                        "stock",
                        "stone",
                        "stood",
                        "store",
                        "storm",
                        "story",
                        "strip",
                        "stuck",
                        "study",
                        "stuff",
                        "style",
                        "sugar",
                        "suite",
                        "super",
                        "sweet",
                        "table",
                        "taken",
                        "taste",
                        "taxes",
                        "teach",
                        "teeth",
                        "terry",
                        "texas",
                        "thank",
                        "theft",
                        "their",
                        "theme",
                        "there",
                        "these",
                        "thick",
                        "thing",
                        "think",
                        "third",
                        "those",
                        "three",
                        "threw",
                        "throw",
                        "tight",
                        "times",
                        "tired",
                        "title",
                        "today",
                        "topic",
                        "total",
                        "touch",
                        "tough",
                        "tower",
                        "track",
                        "trade",
                        "train",
                        "treat",
                        "trend",
                        "trial",
                        "tried",
                        "tries",
                        "truck",
                        "truly",
                        "trust",
                        "truth",
                        "twice",
                        "under",
                        "undue",
                        "union",
                        "unity",
                        "until",
                        "upper",
                        "upset",
                        "urban",
                        "usage",
                        "usual",
                        "valid",
                        "value",
                        "video",
                        "virus",
                        "visit",
                        "vital",
                        "voice",
                        "waste",
                        "watch",
                        "water",
                        "wheel",
                        "where",
                        "which",
                        "while",
                        "white",
                        "whole",
                        "whose",
                        "woman",
                        "women",
                        "world",
                        "worry",
                        "worse",
                        "worst",
                        "worth",
                        "would",
                        "wound",
                        "write",
                        "wrong",
                        "wrote",
                        "yield",
                        "young",
                        "youth"]
    
    @IBOutlet weak var gametTypeTextWidth: NSLayoutConstraint!
    @IBOutlet weak var gameTypeBackgroundWidth: NSLayoutConstraint!
    @IBOutlet weak var timeTextWidth: NSLayoutConstraint!
    @IBOutlet weak var timeBackgrounWidth: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        btnRandom1.layer.cornerRadius = 10
        btnRandom2.layer.cornerRadius = 10
        btnRandom3.layer.cornerRadius = 10
        btnRandom4.layer.cornerRadius = 10
        btnRandom5.layer.cornerRadius = 10
        
        lblWordCount.font = UIFont.systemFont(ofSize: 45)
        lblPlayingType.font = UIFont.systemFont(ofSize: 18)
        lblTimeSpeed.font = UIFont.systemFont(ofSize: 18)
        gametTypeTextWidth.constant = 213
        gameTypeBackgroundWidth.constant = 243
        timeTextWidth.constant = 167
        timeBackgrounWidth.constant = 189

        //ui changes according to screen size
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
                lblWordCount.font = UIFont.systemFont(ofSize: 45)
                lblPlayingType.font = UIFont.systemFont(ofSize: 16)
                lblTimeSpeed.font = UIFont.systemFont(ofSize: 16)
                gametTypeTextWidth.constant = 201
                gameTypeBackgroundWidth.constant = 221
                timeTextWidth.constant = 167
                timeBackgrounWidth.constant = 189

                self.changeUI(uiH: 120, uiF: 90.0)
            }
            else if(deviceW == 568.0 && deviceH == 320.0)
            {
                lblWordCount.font = UIFont.systemFont(ofSize: 38)
                lblPlayingType.font = UIFont.systemFont(ofSize: 13)
                lblTimeSpeed.font = UIFont.systemFont(ofSize: 13)
                gametTypeTextWidth.constant = 167
                gameTypeBackgroundWidth.constant = 185
                timeTextWidth.constant = 145
                timeBackgrounWidth.constant = 156

                self.changeUI(uiH: 95, uiF: 80.0)
            }
            else if(deviceW == 812.0 && deviceH == 375.0)
            {

                self.changeUI(uiH: 110, uiF: 85.0)
            }
            else{
                self.changeUI(uiH: 132, uiF: 100.0)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        print("viewWillAppear")
        
        self.btnRandom1.isEnabled = true
        self.btnRandom2.isEnabled = true
        self.btnRandom3.isEnabled = true
        self.btnRandom4.isEnabled = true
        self.btnRandom5.isEnabled = true
        
        restarttimer = true
        
        let language = UserDefaults.standard.string(forKey: "gameLanguage") ?? "English"
        
        gameType = UserDefaults.standard.string(forKey: "gameType") ?? "tw"
        
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
            ptime = tw
            timerInterval = tw
            self.lblPlayingType.text = "game type: time per word"
            self.lblTimeSpeed.text = String(format:"time: %.1f sec",tw)
        }
        else
        {
            self.lblPlayingType.text = "game type: total time"
            ptime = Double(tt) * 60.0
            timerInterval = ptime
            self.lblTimeSpeed.text = String(format:"time: %.1f min",tt)
            print(String(format:"tt:%.1f",tt))
        }
        
        wordCount = 0
        timeQty = 0
        lblWordCount.text = String(wordCount)
        
        self.resetBtn()
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
            self.btnRandom1.isHidden = false
            self.btnRandom2.isHidden = false
            self.btnRandom3.isHidden = false
            self.btnRandom4.isHidden = false
            self.btnRandom5.isHidden = false
            
            self.lblWL1.isHidden = false
            self.lblWL2.isHidden = false
            self.lblWL3.isHidden = false
            self.lblWL4.isHidden = false
            self.lblWL5.isHidden = false
            
            self.start()
            self.setWord()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func setWord()
    {
        self.btnRandom1.isEnabled = true
        self.btnRandom2.isEnabled = true
        self.btnRandom3.isEnabled = true
        self.btnRandom4.isEnabled = true
        self.btnRandom5.isEnabled = true
        
        selLetterIndex = 0
        let randomInt = Int.random(in: 0...449)
        let word = arrayOfWords[randomInt]
        let shuffledArray = word.shuffled()
        
        for character in word {
            print(character)
            normalWordArray.append(String(character))
        }
        self.lblWL1.text = normalWordArray[0]
        self.lblWL2.text = normalWordArray[1]
        self.lblWL3.text = normalWordArray[2]
        self.lblWL4.text = normalWordArray[3]
        self.lblWL5.text = normalWordArray[4]
        
        
        for character in shuffledArray {
            wordArray.append(String(character))
        }
        self.btnRandom1.setTitle(wordArray[0], for: .normal)
        self.btnRandom2.setTitle(wordArray[1], for: .normal)
        self.btnRandom3.setTitle(wordArray[2], for: .normal)
        self.btnRandom4.setTitle(wordArray[3], for: .normal)
        self.btnRandom5.setTitle(wordArray[4], for: .normal)
        
        self.btnRandom1.backgroundColor =  UIColor.orange
        self.btnRandom2.backgroundColor =  UIColor.orange
        self.btnRandom3.backgroundColor =  UIColor.orange
        self.btnRandom4.backgroundColor =  UIColor.orange
        self.btnRandom5.backgroundColor =  UIColor.orange
        
        if(restarttimer == true)
        {
            timer = Timer.scheduledTimer(withTimeInterval: timerInterval!, repeats: false) { timer in
                
                self.loseMessage = "time is up"
                self.stop()
                self.performSegue(withIdentifier: "lose", sender: nil)
            }
            
            if(gameType == "tt")
            {
                restarttimer = false
            }
        }
    }
    
    @IBAction func selButton1(_ sender: Any) {
        self.verifyLetter(buttonText: wordArray[0],buttonNumber:0)
    }
    
    @IBAction func selButton2(_ sender: Any) {
        self.verifyLetter(buttonText: wordArray[1],buttonNumber:1)
    }
    
    @IBAction func selButton3(_ sender: Any) {
        self.verifyLetter(buttonText: wordArray[2],buttonNumber:2)
    }
    
    @IBAction func selButton4(_ sender: Any) {
        self.verifyLetter(buttonText: wordArray[3],buttonNumber:3)
    }
    
    @IBAction func selButton5(_ sender: Any) {
        self.verifyLetter(buttonText: wordArray[4],buttonNumber:4)
    }
    
    func verifyLetter(buttonText:String,buttonNumber:Int)
    {
        if(buttonText == normalWordArray[selLetterIndex])
        {
            switch(buttonNumber)
            {
            case 0:
                self.btnRandom1.backgroundColor =  UIColor.green
                self.btnRandom1.isEnabled = false
            case 1:
                self.btnRandom2.backgroundColor =  UIColor.green
                self.btnRandom2.isEnabled = false
            case 2:
                self.btnRandom3.backgroundColor =  UIColor.green
                self.btnRandom3.isEnabled = false
            case 3:
                self.btnRandom4.backgroundColor =  UIColor.green
                self.btnRandom4.isEnabled = false
            case 4:
                self.btnRandom5.backgroundColor =  UIColor.green
                self.btnRandom5.isEnabled = false
            default:
                self.btnRandom1.backgroundColor =  UIColor.orange
                self.btnRandom2.backgroundColor =  UIColor.orange
                self.btnRandom3.backgroundColor =  UIColor.orange
                self.btnRandom4.backgroundColor =  UIColor.orange
                self.btnRandom5.backgroundColor =  UIColor.orange
                self.btnRandom1.isEnabled = true
                self.btnRandom2.isEnabled = true
                self.btnRandom3.isEnabled = true
                self.btnRandom4.isEnabled = true
                self.btnRandom5.isEnabled = true
                
            }
            
            selLetterIndex = selLetterIndex + 1
            
            if(selLetterIndex == 5)
            {
                selLetterIndex = 0
                normalWordArray.removeAll()
                wordArray.removeAll()
                
                wordCount = wordCount + 1
                lblWordCount.text = String(wordCount)
                //timeQty = 0
               
                if(gameType == "tw")
                {
                    timer?.invalidate()
                    timer = nil
                    print("timer invalidate")
                }
                
                self.setWord()
                print("Change word - reset timer")
            }
            
        }
        else
        {
            print("Wrong")
            switch(buttonNumber)
            {
            case 0:
                self.btnRandom1.backgroundColor =  UIColor.red
            case 1:
                self.btnRandom2.backgroundColor =  UIColor.red
            case 2:
                self.btnRandom3.backgroundColor =  UIColor.red
            case 3:
                self.btnRandom4.backgroundColor =  UIColor.red
            case 4:
                self.btnRandom5.backgroundColor =  UIColor.red
            default:
                self.btnRandom1.backgroundColor =  UIColor.orange
                self.btnRandom2.backgroundColor =  UIColor.orange
                self.btnRandom3.backgroundColor =  UIColor.orange
                self.btnRandom4.backgroundColor =  UIColor.orange
                self.btnRandom5.backgroundColor =  UIColor.orange
            }
            
            if(gameType == "tw")
            {
                timer?.invalidate()
                self.stop()
                self.loseMessage = "wrong letter"
                self.performSegue(withIdentifier: "lose", sender: nil)
            }
            else{
               self.setWord()
            }
        }
    }
    
    
     func resetBtn() {
        
        // Invalidate timer
        playingtimer?.invalidate()
        
        // Reset timer variables
        startTime = 0
        time = 0
        elapsed = 0
        status = false
        
        // Reset all three labels to 00
        let strReset = String("00")
        labelMinute.text = strReset
        labelSecond.text = strReset
        labelMillisecond.text = strReset
        
    }
    
    func start() {
        
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
        playingtimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        // Set Start/Stop button to true
        status = true
        
    }
    
    func stop() {
        
        elapsed = Date().timeIntervalSinceReferenceDate - startTime
        playingtimer?.invalidate()
        
        // Set Start/Stop button to false
        status = false
        
    }
    
    @objc func updateCounter() {
        
        // Calculate total time since timer started in seconds
        time = Date().timeIntervalSinceReferenceDate - startTime
        
        // Calculate minutes
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        
        // Calculate seconds
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)
        
        // Calculate milliseconds
        let milliseconds = UInt8(time * 100)
        
        // Format time vars with leading zero
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        // Add time vars to relevant labels
        labelMinute.text = strMinutes
        labelSecond.text = strSeconds
        labelMillisecond.text = strMilliseconds
        
    }
    
    func changeUI(uiH:CGFloat,uiF:CGFloat)
    {
        letterHeight1.constant = uiH
        shuffledHeight1.constant = uiH
        lblWL1.font = .systemFont(ofSize: uiF)
        btnRandom1.titleLabel?.font = .systemFont(ofSize: uiF)
        
        letterHeight2.constant = uiH
        shuffledHeight2.constant = uiH
        lblWL2.font = .systemFont(ofSize: uiF)
        btnRandom2.titleLabel?.font = .systemFont(ofSize: uiF)
        
        letterHeight3.constant = uiH
        shuffledHeight3.constant = uiH
        lblWL3.font = .systemFont(ofSize: uiF)
        btnRandom3.titleLabel?.font = .systemFont(ofSize: uiF)
        
        letterHeight4.constant = uiH
        shuffledHeight4.constant = uiH
        lblWL4.font = .systemFont(ofSize: uiF)
        btnRandom4.titleLabel?.font = .systemFont(ofSize: uiF)
        
        letterHeight5.constant = uiH
        shuffledHeight5.constant = uiH
        lblWL5.font = .systemFont(ofSize: uiF)
        btnRandom5.titleLabel?.font = .systemFont(ofSize: uiF)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        self.btnRandom1.isHidden = true
        self.btnRandom2.isHidden = true
        self.btnRandom3.isHidden = true
        self.btnRandom4.isHidden = true
        self.btnRandom5.isHidden = true
        
        self.lblWL1.isHidden = true
        self.lblWL2.isHidden = true
        self.lblWL3.isHidden = true
        self.lblWL4.isHidden = true
        self.lblWL5.isHidden = true
        
        let vc = segue.destination as! WrongViewController
        timer?.invalidate()
        vc.wordScore = Int(self.lblWordCount.text!)
        vc.gameType = self.gameType
        vc.playtime = ptime
        vc.playingtime = String(format:"%@:%@:%@",self.labelMinute.text!,self.labelSecond.text!,self.labelMillisecond.text!)
        vc.loseMessage = loseMessage
    }
 

}
