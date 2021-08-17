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
    let img_src: String
    let earth_date: String
    let rover: Rover
}

struct Camera: Codable {
    let name: String
}

struct Rover: Codable {
    let name: String
    let landing_date: String
    let launch_date: String
    let status: String
}

