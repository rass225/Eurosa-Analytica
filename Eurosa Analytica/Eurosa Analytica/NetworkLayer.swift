import Foundation
import Combine
import SwiftUI

class NetworkManager {
    
    func goToPoocoin(address: String) {
        let base = "https://poocoin.app/tokens/"
        if let url = URL(string: base + address) {
            UIApplication.shared.open(url)
        }
    }
    
    func goToBscScanner(address: String) {
        let base = "https://bscscan.com/token/"
        if let url = URL(string: base + address) {
            UIApplication.shared.open(url)
        }
    }
    
    func goToWebsite(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}


struct APIClient {
    func fetch<T: Codable>(url: String, completion: @escaping  (Result<T, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("04741752-1833-49eb-8f4b-1a121c82ac9f", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            do {
                let response = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(response))
            } catch let err {
                completion(.failure(err))
            }
        }.resume()
    }
}
