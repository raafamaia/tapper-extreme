//
//  ViewController.swift
//  App2 - Tapper
//
//  Created by R. Maia on 5/11/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    var maxTaps: Int = 0;
    var currentTaps: Int = 0;
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!

    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            setGame(true);
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0;
            
            updateTapsLbl();
        }
    }
    
    @IBAction func onCoinPressed(sender: UIButton!) {
        
        currentTaps += 1
        updateTapsLbl();
        
        if isGameOver(){
            restartGame()
        }
        
    }
    
    func setGame(b: Bool) {
        logoImg.hidden = b;
        playBtn.hidden = b;
        howManyTapsTxt.hidden = b;
        
        tapButton.hidden = !b;
        tapsLbl.hidden = !b;
    }
    
    
    func updateTapsLbl(){
         tapsLbl.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps{
            return true
        }
        
        return false
    }
    
    func restartGame(){
        maxTaps = 0
        howManyTapsTxt.text = ""
        setGame(false);
    }
    
    

}

