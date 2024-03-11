import Foundation

class WebService {
    
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:8080/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching orders: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let orders = try JSONDecoder().decode([Order].self, from: data)
                DispatchQueue.main.async {
                    completion(orders)
                }
            } catch {
                print("Error decoding orders: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:8080/orders") else {
            fatalError("Invalid URL")
        }
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(order)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error creating coffee order: \(error?.localizedDescription ?? "Unknown error")")
                    completion(nil)
                    return
                }
                
                do {
                    let createOrderResponse = try JSONDecoder().decode(CreateOrderResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(createOrderResponse)
                    }
                } catch {
                    print("Error decoding create order response: \(error.localizedDescription)")
                    completion(nil)
                }
            }.resume()
        } catch {
            print("Error encoding order: \(error.localizedDescription)")
            completion(nil)
        }
    }

}
