//
//  Service.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 12.08.2021.
//

import Foundation
import Alamofire

final class Service {
    
    enum ROVER: String {
        case Curiosity = "curiosity"
        case Opportunity = "opportunity"
        case Spirit = "spirit"
    }
    
    static let shared = Service()
    
    func fetchRequest(rover: ROVER,queryParams: [String:String],page: Int,sol: Int,completionHandler: @escaping (RoverModel) -> Void){
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.nasa.gov"
        urlComponents.path = "/mars-photos/api/v1/rovers/\(rover.rawValue)/photos"
        urlComponents.setQueryItems(with: queryParams)
        
        let requestStr = urlComponents.url!.absoluteString + "&sol=\(sol)&page=\(page)"
        AF.request(requestStr).responseDecodable(of: RoverModel.self) { response in
            switch response.result {
            case .success(let model):
                completionHandler(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
