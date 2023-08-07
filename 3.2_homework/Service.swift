//
//  Service.swift
//  3.2_homework
//
//  Created by Artem Ryabichev on 04.08.2023.
//

import Foundation

class Service {
    func getNews(country: String, category: String, limit: String, completion: @escaping ([News]) -> ()) {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "newsapi.org"
        urlComponent.path = "/v2/top-headlines"
        urlComponent.queryItems = [
            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "category", value: category),
            URLQueryItem(name: "pageSize", value: limit),
            URLQueryItem(name: "apiKey", value: "4dbbac2ed5004e238481c1c0ffda0413")
        ]
        
        guard let url = urlComponent.url else { return }
        let query = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: query) { data, responce, error in
            guard error == nil else { print( error!.localizedDescription)
                return }
            guard let data = data else { return }
            guard let results = try? JSONDecoder().decode(Responce.self, from: data) else {  return }
            DispatchQueue.main.async {
                completion(results.articles)
            }
        }.resume()
    }
}

struct Responce: Decodable {
    var articles: [News]
}

struct News: Decodable {
    var title: String?
    var content: String?
    var url: String
    var description: String?
}
