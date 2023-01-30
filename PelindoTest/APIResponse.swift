//
//  APIResponse.swift
//  Pelindo Test
//
//  Created by Nabila on 29/01/23.
//

import Foundation

struct APIResponse<Element: Codable>: Codable {
    let status: String?
    let message: String?
    let data: Element?
}
