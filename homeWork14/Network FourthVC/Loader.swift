//
//  CharactersEpisodesLoader.swift
//  homeWork14
//
//  Created by Антон Михнюкевич on 20.01.2023.
//

import Foundation
import Alamofire

protocol CharactersParsingDelegate {
    func charactersTableUpdate(chactersData: [Result], infoData: Info)
}

protocol EpisodesParsingDelegate {
    func episodesTableUpdate(name: String, episodeNumber: String)
}
 
class CharactersParsing {
    
    var delegate: CharactersParsingDelegate?
    
    var url = allCharactersURL
    
    var isPagination = false
    
        func allCharactersParsing(completion: @escaping ([Result]) -> Void) {
    
            AF.request(self.url)
                .validate()
                .responseDecodable(of: Welcome.self, queue: .main) { response in
                    
                    guard let data = response.value else { return }
                    let result: [Result] = []

                    DispatchQueue.main.async {
                        
                        self.delegate?.charactersTableUpdate(chactersData: data.results, infoData: data.info)
                        
                            }
                    
                    completion(result)
            }
            
    }

    
    func parsingForPagination(url: String) {
        
        if isPagination {
            
            self.isPagination = false
            
            let url = url
            
            AF.request(url)
                
                .validate()
                .responseDecodable(of: Welcome.self, queue: .main) { response in
                    
                    guard let data = response.value else {return}
                    
                    DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                        self.delegate?.charactersTableUpdate(chactersData: data.results, infoData: data.info)
                        
                    }
                }
        }
    }
}


class EpisodesParsing {

    var delegate: EpisodesParsingDelegate?

    func episodesParsing(url: String) {

        let url = url

        AF.request(url)

            .validate()
            .responseDecodable(of: Episodes.self, queue: .main) { response in

                guard let data = response.value else {return}
                
                DispatchQueue.main.async {
                    self.delegate?.episodesTableUpdate(name: data.name!, episodeNumber: data.episode!)

                }

            }
    }
}

