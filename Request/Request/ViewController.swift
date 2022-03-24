//
//  ViewController.swift
//  Request
//
//  Created by Cristina Mihaela on 18.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://api.sunrise-sunset.org/json?lat=47.159809&lng=27.587200&date=today"
        getData(from: url)
    }

    private func getData(from url: String) {

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }

            // have data
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            } catch {
                print("failed to convert \(error.localizedDescription)")
            }

            guard let json = result else {
                return
            }

            print(json.status)
            print(json.results.sunrise)
            print(json.results.sunset)
            print(json.results.solar_noon)
        })
        task.resume()


    }


}


struct Response: Codable {
    let results: MyResult
    let status: String
}

struct MyResult: Codable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_length: String
    let civil_twilight_begin: String
    let civil_twilight_end: String
    let nautical_twilight_begin: String
    let nautical_twilight_end: String
    let astronomical_twilight_begin: String
    let astronomical_twilight_end: String
}

//{
//   "results":{
//      "sunrise":"6:22:44 AM",
//      "sunset":"6:28:43 PM",
//      "solar_noon":"12:25:43 PM",
//      "day_length":"12:05:59",
//      "civil_twilight_begin":"5:58:16 AM",
//      "civil_twilight_end":"6:53:10 PM",
//      "nautical_twilight_begin":"5:28:10 AM",
//      "nautical_twilight_end":"7:23:16 PM",
//      "astronomical_twilight_begin":"4:57:43 AM",
//      "astronomical_twilight_end":"7:53:44 PM"
//   },
//   "status":"OK"
//}
