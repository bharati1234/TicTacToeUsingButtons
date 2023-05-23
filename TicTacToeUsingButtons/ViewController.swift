//
//  ViewController.swift
//  TicTacToeUsingButtons
//
//  Created by Apple on 12/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var NOUGHT = "O"
    var CROSS = "X"

   
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func boardTapAction(_ sender: UIButton) {
        let input = sender.title(for: .normal) ?? ""
        let oldValueTurn = turnLabel.text ?? ""
    
        if input.isEmpty {
        
        sender.setTitle(turnLabel.text, for: .normal)
        if(turnLabel.text == CROSS){
            
           turnLabel.text = NOUGHT
            
        }else{
            turnLabel.text = CROSS
        }
        }
        
        
        
        if isWinCondition() {
            //clearBoard()
            resultAlert(title: "Finish", msg: "\(oldValueTurn) won")
        }else if((a1.getText() != "") && (a2.getText() != "") && (a3.getText() != "") && (b1.getText() != "") && (b2.getText() != "") && (b3.getText() != "") && (c1.getText() != "") && (c2.getText() != "") && (c3.getText() != "" )){
            resultAlert(title: "Draw", msg: "play again")
            
        }
        
       
    }
    
    func isWinCondition() -> Bool{
        
        if(a1.getText() == a2.getText() && a2.getText() == a3.getText() && a1.getText() != "" && a2.getText() != "" && a3.getText() != "") {
                return true
        }
       
        if(b1.getText() == b2.getText() && b2.getText() == b3.getText() && b1.getText() != "" && b2.getText() != "" && b3.getText() != ""){
            return true
            
        }
        
        if(c1.getText() == c2.getText() && c2.getText() == c3.getText() && c1.getText() != "" && c2.getText() != "" && c3.getText() != ""){
            return true
            
        }
        if(a1.getText() == b1.getText() && b1.getText() == c1.getText() && a1.getText() != "" && b1.getText() != "" && c1.getText() != ""){
            return true
            
        }
        if(a2.getText() == b2.getText() && b2.getText() == c2.getText() && a2.getText() != "" && b2.getText() != "" && c2.getText() != ""){
            return true
            
        }
        if(a3.getText() == b3.getText() && b3.getText() == c3.getText() && a3.getText() != "" && b3.getText() != "" && c3.getText() != ""){
            return true
            
        }
        if(a1.getText() == b2.getText() && b2.getText() == c3.getText() && a1.getText() != "" && b2.getText() != "" && c3.getText() != ""){
            return true
            
        }
        if(c1.getText() == b2.getText() && b2.getText() == a3.getText() && c1.getText() != "" && b2.getText() != "" && a3.getText() != ""){
            return true
            
        }
        
        return false
       
    }
    
    
    func resultAlert(title: String, msg: String){
        let ac = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {
            (_) in
            self.clearBoard()
        }))
        self.present(ac, animated: true, completion: nil)
    }


    func clearBoard(){
        turnLabel.text = CROSS
        a1.setTitle("", for: .normal)
        a2.setTitle("", for: .normal)
        a3.setTitle("", for: .normal)
        b1.setTitle("", for: .normal)
        b2.setTitle("", for: .normal)
        b3.setTitle("", for: .normal)
        c1.setTitle("", for: .normal)
        c2.setTitle("", for: .normal)
        c3.setTitle("", for: .normal)

    }
    
        
}

    
extension UIButton {
    //get value of button
    func getText() -> String {
        return self.title(for: .normal) ?? ""
    }
}
