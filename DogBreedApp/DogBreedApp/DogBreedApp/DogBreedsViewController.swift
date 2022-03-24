//
//  ViewController.swift
//  DogBreedApp
//
//  Created by Sebastian Zus on 11.03.2022.
//

import UIKit

class DogBreedsViewController: UIViewController {
    struct Constant {
        static let dogBreedCellIdentifier = "DogBreedCell"
    }

    @IBOutlet weak var tableView: UITableView!

    private let codableParsing = true
    private let urlSession = URLSession(configuration: .default)

    private var dogBreeds = [DogBreed]()

    private var dictionaryArr = [[String : Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "DogBreedTableViewCell", bundle: nil), forCellReuseIdentifier: Constant.dogBreedCellIdentifier)

        let url = URL(string: "https://api.thedogapi.com/v1/breeds")!


        let dataTask = urlSession.dataTask(with: url) {[weak self] data, response, error in
            // ASYNC-Called CODE
            guard let self = self else { return }

            if let error = error {
                print("Request error received: \(error)")
            } else if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("Request error received: Expected 200 status code but received: \(response.statusCode)")
            } else if let data = data {
                // have data
                do {
                    if self.codableParsing {
                        self.dogBreeds = try self.codableDeserialization(for: data)
                        print(self.dogBreeds)
                    } else {
                        self.dictionaryArr = try self.dictionaryDeserialization(for: data)
                    }
                } catch {
                    print("Data serialization error: \(error)")
                }

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Request error received: Unexpected condition!")
            }
        }
        dataTask.resume()
    }

    private func codableDeserialization(for data: Data) throws -> [DogBreed] {
        let jsonDecoder = JSONDecoder()
        let breeds = try jsonDecoder.decode([DogBreed].self, from: data)
        return breeds
    }

    private func dictionaryDeserialization(for data: Data) throws -> [[String: Any]] {
        guard let dataArr = try JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]] else {
            print("Data serialization error: Unexpectd format received !")
            return [[String : Any]]()
        }
        return dataArr
    }

    @discardableResult private func downloadImage(image: Image, with completionHandler: @escaping (Data)->()) -> URLSessionDataTask {
        let url = URL(string: image.url)!
        let imageDataTask = urlSession.dataTask(with: url) { data, response, error in
            // ASYNC-Called CODE
            if let error = error {
                print("Download image error received: \(error)")
            } else if let data = data {
                DispatchQueue.main.async {
                    completionHandler(data)
                }
            } else {
                print("Download image error: Unexpected condition!")
            }
        }
        imageDataTask.resume()
        return imageDataTask
    }
}

extension DogBreedsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return codableParsing ? dogBreeds.count : dictionaryArr.count
    }
}

extension DogBreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dogBreedCell = tableView.dequeueReusableCell(withIdentifier: Constant.dogBreedCellIdentifier, for: indexPath) as? DogBreedTableViewCell else {
            print("UI error: Cell deque resulted in unexpected instance!")
            return UITableViewCell()
        }

        var title: String?
        var description: String?
        if codableParsing {
            let dogBreed = dogBreeds[indexPath.row]
            title = dogBreed.name
            description = dogBreed.temperament

            //        FIXME: Bad way (synchronous):
            //            cell.dogBreedImageView.image = try! UIImage(data: Data(contentsOf: URL(string: dogBreed.image.url)!))

            if let imageData = dogBreed.imageData {
                dogBreedCell.dogBreedImageView?.image = UIImage(data: imageData)
            } else {
                downloadImage(image: dogBreed.image) {[weak self] data in
                    // ASYNC-Called CODE
                    self?.dogBreeds[indexPath.row].imageData = data
                    tableView.reloadRows(at: [indexPath], with: .fade)
                }
            }
        } else {
            let item = dictionaryArr[indexPath.row]
            title = item["name"] as? String
            description = item["temperament"] as? String
        }

        dogBreedCell.titleLabel.text = title
        dogBreedCell.descriptionLabel.text = description
        return dogBreedCell
    }
}
