import UIKit

struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

struct Music: Codable {
    let songName, artistName, albumName, previewUrl, imageUrl: String?
    private let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
        case previewUrl
        case imageUrl = "artworkUrl100"
        case releaseDate
    }
}


func getMethod() {
    // URL 구조체 만들기
    guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=jazz") else {
        print("Error: cannot create URL")
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error HTTP request failed")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let musicArray = try decoder.decode(MusicData.self, from: safeData)
            dump(musicArray)
        } catch {
           print(error)
        }
        
    }.resume()
}

getMethod()

