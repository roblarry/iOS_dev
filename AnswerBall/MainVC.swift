//
//  MainVC.swift
//  AnswerBall
//
//  Created by Robert Larry on 6/14/16.
//  Copyright © 2016 Robert Larry. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var label: UILabel!
    
    var answers = [
        "I'm not a mindreader!",
        "All indicators point to YES!",
        "All indicators point to NO!",
        "Watch your language!",
        "It seems highly unlikely.",
        "Please speak up!",
        "It seems highly likely.",
        "Yes, indeed!",
        "Absolutely not!",
        "Please ask again later...",
        "Seriously?",
        "That was a dumb question.",
        "I was wondering the same thing!",
        "I can't answer that truthfully.",
        "What do you think?",
        "OMG YES!",
        "OMG NO!",
        "Imagine that!",
        "Really?",
        "Did you just ask that?",
        "Of course.",
        "Ask a higher power.",
        "The force is with you.",
        "The force is not near.",
        "You're unbelievable!",
        "Can I get a translation please?",
        "I'm gonna guess... NO!",
        "I'm gonna guess... YES!",
        "It would seem so.",
        "That does not seem to be true.",
        "Does a bear sh... never mind.",
        "I need a new profession!",
        "The odds are against that.",
        "The odds are in your favor.",
        "Can we skip this one?",
        "Ask a different question please.",
        "I'm doing good, yes I know you didn't ask.",
        "My connection to the stars was lost.",
        "Do you want the truth?",
        "I can see no answer but yes."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = "Ask a Question"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getAnswerTapped(sender: AnyObject) {
        
        //Get a random number from the array count
        let random = Int(arc4random_uniform(UInt32(answers.count)))
        
        //Display the answer
        
        label.text = answers[random]
        
        //Play the sound
        
        do {
            try playSound("Shakesound", fileExtension: "wav")
        } catch {
            return
        }

    }
    
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        getAnswerTapped(self)
    }
    
    
        func playSound(fileName: String, fileExtension: String) throws {
            
            let dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
            
            dispatch_async(dispatchQueue, { let mainBundle = NSBundle.mainBundle()
                
                let filePath = mainBundle.pathForResource("\(fileName)", ofType:"\(fileExtension)")
                
                if let path = filePath{
                    let fileData = NSData(contentsOfFile: path)
                    
                    do {
                        /* Start the audio player */
                        self.audioPlayer = try AVAudioPlayer(data: fileData!)
                        
                        guard let player : AVAudioPlayer? = self.audioPlayer else {
                            return
                        }
                        
                        /* Set the delegate and start playing */
                        player!.delegate = self
                        if player!.prepareToPlay() && player!.play() {
                            /* Successfully started playing */
                        } else {
                            /* Failed to play */
                        }
                        
                    } catch {
                        //self.audioPlayer = nil
                        return
                    }
                    
                }
                
            })
            
        }

        
    }

















