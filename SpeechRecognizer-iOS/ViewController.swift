//
//  ViewController.swift
//  SpeechRecognizer-iOS
//
//  Created by GongYuhua on 2019/7/8.
//  Copyright © 2019 Agora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var channelTextField: UITextField!
    @IBOutlet weak var localSwitcher: UISegmentedControl!
    @IBOutlet weak var joinButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        setupNotifications()
    }
    
    func setupNotifications() {
        // Get the default notification center instance.
        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(handleRouteChange),
                       name: AVAudioSession.routeChangeNotification,
                       object: nil)
    }

    @objc func handleRouteChange(notification: Notification) {
        guard let routeChangeReason = AVAudioSession.RouteChangeReason(rawValue: notification.userInfo?[AVAudioSessionRouteChangeReasonKey] as! UInt) else {
            print("AudioSession route change notification not found?")
            return
        }
        let previousRoute = notification.userInfo?[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription
        if routeChangeReason == AVAudioSession.RouteChangeReason.newDeviceAvailable {
            print("AudioSession New audio device available \(notification.debugDescription)")
        } else if routeChangeReason == AVAudioSession.RouteChangeReason.routeConfigurationChange {
            print("AudioSession New route config change \(notification.debugDescription)")
        } else if notification.userInfo?[AVAudioSessionRouteChangeReasonKey] as? UInt == AVAudioSession.RouteChangeReason.categoryChange.rawValue {
            print("AudioSession category changed to:\n\(AVAudioSession.sharedInstance().currentCategoryDescription) \(notification.debugDescription)")
        }
        else if let other = notification.userInfo?[AVAudioSessionRouteChangeReasonKey] as? UInt {
            print("AudioSession route change notification other: \(other)")
        } else {
            print("AudioSession no notification for route change.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier else {
            return
        }
        
        switch segueId {
        case "rootVCToRoomVC":
            let channelVC = segue.destination as! ChannelViewController
            channelVC.channel = channelTextField.text
            channelVC.local = Locale(identifier: localSwitcher.selectedSegmentIndex == 0 ? "en_US" : "zh_CN")
        default:
            return
        }
    }
    
    @IBAction func channelEditing(_ sender: UITextField) {
        if let channel = sender.text, !channel.isEmpty {
            joinButton.isEnabled = true
        } else {
            joinButton.isEnabled = false
        }
    }
}

extension AVAudioSession {
    var currentCategoryDescription: String {
        return "Category: \(self.category),\nMode: \(self.mode), \nCategoryOptions: \(self.categoryOptions)"
    }
}
