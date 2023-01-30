//
//  UserApiManager.swift
//  PelindoTest
//
//  Created by Nabila on 30/01/23.
//

import Foundation

class UserApiManager {
    
    func deleteUser(userID: Int, didDeleteUser: @escaping ((Result<String, Error>)) -> Void) {
        let endpoint = "http://localhost:8888/pelindotest/delete_user_data.php?userid=\(userID)"
        
        guard let apiUrl = URL(string: endpoint) else {return}

        // MARK: Step 1 Fetch The API
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            if let error = error {
                didDeleteUser(.failure(error))
                return // stop process
            }

            guard let data = data else {return} // unwraping optional value

            // MARK: Step 2 Parse Json/Data
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(APIResponse<User>.self, from: data)
                didDeleteUser(.success(responseData.message ?? ""))
            } catch let err {
                // MARK: If something bad happen :(
                didDeleteUser(.failure(err))
            }

        }.resume()
    }
    
    func getAllUser(didGetAllUser: @escaping ((Result<[User], Error>) -> Void)) {
        let endpoint = "http://localhost:8888/pelindotest/get_user.php?userid=all"
        
        guard let apiUrl = URL(string: endpoint) else { return }
        
        // MARK: Step 1 Fetch The API
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            if let error = error {
                didGetAllUser(.failure(error))
                return
            }
            
            guard let data = data else { return } // unwraping optional value
            
            print(String(decoding: data, as: UTF8.self))
            
            // MARK: Step 2 Parse Json/Data
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(APIResponse<[User]>.self, from: data)
                didGetAllUser(.success(responseData.data ?? []))
            } catch let err {
                // MARK: If something bad happen :(
                didGetAllUser(.failure(err))
            }
        
        }.resume()
    }
    
//    func getUser(userID: String) {
//        guard let apiUrl = URL(string: "http://localhost:8888/pelindotest/get_user.php?userid=\(userID)") else {return}
//
//        // MARK: Step 1 Fetch The API
//        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
//            if error != nil {
//                print("Error: \(error)")
//                return // stop process
//            }
//
//            guard let data = data else {return} // unwraping optional value
//
//            print(String(decoding: data, as: UTF8.self))
//
//            // MARK: Step 2 Parse Json/Data
//            do {
//                let decoder = JSONDecoder()
//                let responseData = try decoder.decode(APIResponse.self, from: data)
//
//                // Coba cetak temperatu
//
//                print(responseData.message)
//
//            } catch let err {
//                // MARK: If something bad happen :(
//                print("Error Bro: ", err)
//            }
//
//        }.resume()
//    }
    
    func setUserData(user: User, didSetUserData: @escaping ((Result<String, Error>) -> Void)) {
        let endpoint = "http://localhost:8888/pelindotest/set_user_data.php"
        
        guard let apiUrl = URL(string: endpoint) else {return}
        
        var request = URLRequest(url: apiUrl)

        // Serialize HTTP Body data as JSON
        let body = [
            "namalengkap": user.namalengkap,
            "username": user.username,
            "password": user.password,
            "status": user.status
        ]

        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )

        // Change the URLRequest to a POST request
        request.httpMethod = "POST"
        request.httpBody = bodyData

        // MARK: Step 1 Fetch The API
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let errorNotNil = error {
                didSetUserData(.failure(errorNotNil))
                return // stop process
            }

            guard let data = data else {return} // unwraping optional value
            
            print(String(decoding: data, as: UTF8.self))

            // MARK: Step 2 Parse Json/Data
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(APIResponse<User>.self, from: data)
                didSetUserData(.success(responseData.message ?? ""))
            } catch let err {
                didSetUserData(.failure(err))
            }
        }.resume()
    }
    
}
