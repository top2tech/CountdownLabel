//
//  ViewController.swift
//  CountdownLabelExample
//
//  Created by suzuki keishi on 2016/01/06.
//  Copyright © 2016 suzuki_keishi. All rights reserved.
//

import UIKit
import CountdownLabel

class ViewController: UIViewController {

    @IBOutlet weak var countdownLabel1: CountdownLabel!
    @IBOutlet weak var countdownLabelAnvil: CountdownLabel!
    @IBOutlet weak var countdownLabelBurn: CountdownLabel!
    @IBOutlet weak var countdownLabelEvaporate: CountdownLabel!
    @IBOutlet weak var countdownLabelFall: CountdownLabel!
    @IBOutlet weak var countdownLabelPixelate: CountdownLabel!
    @IBOutlet weak var countdownLabelScale: CountdownLabel!
    @IBOutlet weak var countdownLabelSparkle: CountdownLabel!
    @IBOutlet weak var countdownLabel2: CountdownLabel!
    @IBOutlet weak var countdownLabel3: CountdownLabel!
    @IBOutlet weak var countdownLabel4: CountdownLabel!
    @IBOutlet weak var countdownLabel5: CountdownLabel!
    @IBOutlet weak var countdownLabel6: CountdownLabel!
    @IBOutlet weak var countdownLabel7: CountdownLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. normal
        countdownLabel1.setCountDownTime(60*60)
        countdownLabel1.start()

        // option animation ( using LTMorphing inside )
        countdownLabelAnvil.setCountDownTime(60*60)
        countdownLabelAnvil.start()

        countdownLabelBurn.setCountDownTime(60*60)
        countdownLabelBurn.animationType = .burn
        countdownLabelBurn.start()
        
        countdownLabelEvaporate.setCountDownTime(60*60)
        countdownLabelEvaporate.animationType = .evaporate
        countdownLabelEvaporate.start()
        
        countdownLabelFall.setCountDownTime(60*60)
        countdownLabelFall.animationType = .fall
        countdownLabelFall.start()
        
        countdownLabelPixelate.setCountDownTime(60*60)
        countdownLabelPixelate.animationType = .pixelate
        countdownLabelPixelate.start()
        
        countdownLabelScale.setCountDownTime(60*60)
        countdownLabelScale.animationType = .scale
        countdownLabelScale.start()
        
        countdownLabelSparkle.setCountDownTime(60*60)
        countdownLabelSparkle.animationType = .sparkle
        countdownLabelSparkle.start()
        
        // 2. style
        countdownLabel2.setCountDownTime(60*60)
        countdownLabel2.animationType = .evaporate
        countdownLabel2.textColor = .orange
        countdownLabel2.font = UIFont(name:"Courier", size:UIFont.labelFontSize)
        countdownLabel2.start()
        
        // 3. get status
        countdownLabel3.setCountDownTime(30)
        countdownLabel3.animationType = .sparkle
        countdownLabel3.start()
        
        // 4. control countdown
        countdownLabel4.setCountDownTime(30)
        countdownLabel4.animationType = .pixelate
        countdownLabel4.start()
        
        // 5. control countdown
        countdownLabel5.setCountDownTime(10)
        countdownLabel5.animationType = .pixelate
        countdownLabel5.countdownDelegate = self
        countdownLabel5.start() { [unowned self] in
            self.countdownLabel5.text = "timer finished."
        }
        
        // 6. control countdown
        countdownLabel6.setCountDownTime(30)
        countdownLabel5.animationType = .scale
        _ = countdownLabel6.then(10) { [unowned self] in
            self.countdownLabel6.animationType = .pixelate
            self.countdownLabel6.textColor = .green
        }
        _ = countdownLabel6.then(5) { [unowned self] in
            self.countdownLabel6.animationType = .sparkle
            self.countdownLabel6.textColor = .yellow
        }
        countdownLabel6.start() {
            self.countdownLabel6.textColor = .white
        }
       
        // 7. attributed text
        countdownLabel7.setCountDownTime(30)
        countdownLabel7.animationType = .anvil
        countdownLabel7.timeFormat = "ss"
        countdownLabel7.countdownAttributedText = CountdownAttributedText(text: "HELLO TIME IS HERE NOW",
            replacement: "HERE",
            attributes: [NSForegroundColorAttributeName: UIColor.red])
        countdownLabel7.start() {
            self.countdownLabel7.text = "timer finished."
        }
    }
    
    // MARK: - countdownLabel3's IBAction
    @IBAction func getTimerCounted(_ sender: UIButton) {
        alert("\(countdownLabel3.timeCounted)")
    }
    
    @IBAction func getTimerRemain(_ sender: UIButton) {
        alert("\(countdownLabel3.timeRemaining)")
    }
    
    // MARK: - countdownLabel4's IBAction
    @IBAction func controlStartStop(_ sender: UIButton) {
        if countdownLabel4.isPaused {
            countdownLabel4.start()
            sender.setTitle("pause", for: UIControlState())
        } else {
            countdownLabel4.pause()
            sender.setTitle("start", for: UIControlState())
        }
    }
    
    @IBAction func minus(_ sender: UIButton) {
        countdownLabel4.addTime(-2)
    }
    
    @IBAction func plus(_ sender: UIButton) {
        countdownLabel4.addTime(2)
    }
}

extension ViewController: CountdownLabelDelegate {
    func countdownFinished() {
        debugPrint("countdownFinished at delegate.")
    }
    
    func countingAt(timeCounted: TimeInterval, timeRemaining: TimeInterval) {
        debugPrint("time counted at delegate=\(timeCounted)")
        debugPrint("time remaining at delegate=\(timeRemaining)")
    }
    
}

extension ViewController {
    func alert(_ title: String) {
        let vc = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(vc, animated: true, completion: nil)
    }
}

