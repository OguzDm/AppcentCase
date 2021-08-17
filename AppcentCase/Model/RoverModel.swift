//
//  RoverModel.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 13.08.2021.
//

import Foundation

struct RoverModel: Codable {
    let photos: [RoverPhotos]
}

struct RoverPhotos: Codable {
    let camera: Camera
    let imgSrc: String
    let earthDate: String
    let rover: Rover
    
    enum CodingKeys: String, CodingKey {
        case camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

struct Camera: Codable {
    let name: String
}

struct Rover: Codable {
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}

