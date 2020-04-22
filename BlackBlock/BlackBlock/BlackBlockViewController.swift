//
//  BlackBlockViewController.swift
//  BlackBlock
//
//  Created by Ricardo Ribeiro on 15/04/2020.
//  Copyright © 2020 Ricardo Ribeiro. All rights reserved.
//

import Cocoa

class BlackBlockViewController: NSViewController, NSTextViewDelegate {
    
    @IBOutlet var textBox: NSTextView!
    
    let defaults = UserDefaults.standard
    
    struct defaultsKeys {
        static let textContent = ""
    }

    override func viewDidAppear() {
        super.viewDidLoad()
        textBox.font = NSFont(name: "Helvetica", size: 12)
        textBox.usesAdaptiveColorMappingForDarkAppearance = true
        textBox.textContainerInset = NSSize(width: 5, height: 5)
        textBox.delegate = self;
        
        if let textContent = defaults.string(forKey: defaultsKeys.textContent) {
            textBox.string = textContent
        } else {
            textBox.string = ""
        }
   }
    
    func textDidChange(_ notification: Notification) {
        guard let textView = notification.object as? NSTextView else { return }
        defaults.set(textView.string, forKey: defaultsKeys.textContent)
    }
    
}

extension BlackBlockViewController {
  static func freshController() -> BlackBlockViewController {
    let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
    let identifier = NSStoryboard.SceneIdentifier("BlackBlockViewController")
    guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? BlackBlockViewController else {
      fatalError("Cannot find BlackBlockViewController? - Check Main.storyboard")
    }
    return viewcontroller
  }
}
