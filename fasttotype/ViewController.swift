//
//  ViewController.swift
//  fasttotype
//
//  Created by Jaime on 7/21/19.
//  Copyright © 2019 Jaime. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var selLetterIndex = 0
    var letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","Space"]
    @IBOutlet weak var letter: UILabel!
    
    var letterIndex = 0
    
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var selectedText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        selectedText.text = ""

        let timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            
            self.letter.text = self.letterArray[self.letterIndex]
            
            self.letterIndex = self.letterIndex + 1
            if(self.letterIndex == 27)
            {
                self.letterIndex = 0
            }
        }
    }
    
    @IBAction func selectLetter(_ sender: Any) {
        
        var selText = letter.text!
        
        if(selText == "Space")
        {
           selText = " "
        }
        selectedText.text = selectedText.text + selText
    }
}

