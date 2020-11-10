//
//  ViewController.swift
//  SendEmailSampleApp
//
//  Created by Hamid Hoseini on 11/9/20.
//

import MessageUI
import SafariServices
import UIKit

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 50))
        view.addSubview(button)
        button.setTitle("Contact Us", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }

    @objc private func didTapButton() {
        if MFMailComposeViewController.canSendMail() {
            let vc = MFMailComposeViewController()
            vc.delegate = self
            vc.setSubject("Contact Us / Feedback")
            vc.setToRecipients(["mail.hamid.hoseini@gmail.com"])
            vc.setMessageBody("<h3>Hello World</h3>", isHTML: true)
            //vc.addAttachmentData(<#T##attachment: Data##Data#>, mimeType: <#T##String#>, fileName: <#T##String#>)
            
            present(UINavigationController(rootViewController: vc), animated: true)
        }
        else {
            guard let url = URL(string: "https://www.google.com") else {
                return
            }
            let vc = SFSafariViewController(url: url)
            vc.present(vc, animated: true, completion: nil)
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

