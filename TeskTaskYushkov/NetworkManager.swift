//
//  NetworkManager.swift
//  TeskTaskYushkov
//
//  Created by Иван Юшков on 03.12.2020.
//

import Foundation

class NetworkManager {
    
    static func postRequset(urlString: String, searchText: String, completionHandler: @escaping (_ habits: [Habit]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        //create request
        var request = URLRequest(url: url)
        request.addValue("Bearer SoRJvOKwZGos5tGjzIEBBRRLgI0qVrhpgKGX5uHSZcceBVJTobXKoC2NI39m", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let userData = ["search": searchText, "page": "1", "page-size": "20"]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        
        //create session
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let _ = response, let data = data else { return }
            
            do {
                //add first habit in array for top row of table
                var habits = [Habit(id: "id", title: "title")]
                //decode JSON
                let jsonObject = try JSONDecoder().decode(JSONObject.self, from: data)
                for value in jsonObject.data {
                    let habit = Habit(data: value)
                    habits.append(habit)
                }
                //escape closure
                completionHandler(habits)
            } catch let error {
                print(error)
            }
        }.resume()
    }
        
}
