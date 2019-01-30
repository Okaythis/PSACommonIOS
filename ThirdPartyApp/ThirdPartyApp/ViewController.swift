//
//  ViewController.swift
//  ThirdPartyApp
//
//  Created by Bulat, Maksim on 24/01/2019.
//  Copyright © 2019 Bulat, Maksim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct TenantCredentials: Codable {
        let username: String
        let password: String

        enum CodingKeys: String, CodingKey {
            case username
            case password
        }
    }

    let config = URLSessionConfiguration.default
    let linkURL = URL(string: "http://172.20.64.68:10080/tenant-fb/api/link-via-app")!
    let actionURL = URL(string: "http://172.20.64.68:10080/tenant-fb/login")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onLinkButton(_ sender: Any) {
        linkingCodeRequest()
    }

    @IBAction func onActionButton(_ sender: Any) {
        actionRequest()
    }

    func linkingCodeRequest() {
        //Request linking code from your server
        let request = NSMutableURLRequest(url: linkURL)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type":"application/json"]
        let body = TenantCredentials(username: "Tenant", password: "password")
        request.httpBody = try? JSONEncoder().encode(body)
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                let responseObject = jsonResponse as? [String: String]
                if let linkingCode = responseObject?["linkingCode"] {
                    DispatchQueue.main.async {
                        self.openOkay(with: linkingCode)
                    }
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }

    func actionRequest() {
        let request = NSMutableURLRequest(url: actionURL)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type":"application/x-www-form-urlencoded"]
        request.httpBody = "username=tenant&password=password&auth-ok=on".data(using: .utf8)
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: request as URLRequest)
        task.resume()
    }

    func openOkay(with linkingCode: String) {
        if let url = okayURL() {
            UIApplication.shared.open(url.appendingPathComponent("/\(linkingCode)"), options: [:])
        }
    }

    func okayURL() -> URL? {
        var url: URL?
        let host = URL(string: "okayLink:/")
        if let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String {
            url = host?.appendingPathComponent("/\(bundleName)")
        }
        return url
    }
}

