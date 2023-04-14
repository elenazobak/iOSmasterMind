import Foundation

// Update the delegate methods to pass a string
protocol CodeManagerDelegate {
    func didUpdateCode(_ codeManager: CodeManager, fetchedCode: String, gameSettings: GameSettings)
    func didFailedWithError(error: Error)
}

struct CodeManager {
    
    let codeURL = "https://www.random.org/integers/?min=0&max=7&col=4&base=10&format=plain&rnd=new&num="
    var delegate: CodeManagerDelegate?
    
    // Function to fetch code from the server
    func fetchWeather(codeLength: Int, gameSettings: GameSettings) {
        let urlString = "\(codeURL)\(codeLength)" // Adding code length to the URL
        performRequest(with: urlString, gameSettings: gameSettings) // Calling the function to perform the request
    }

    
    // Function to perform the network request
    func performRequest(with urlString: String, gameSettings: GameSettings){
        if let url = URL(string: urlString) { // Creating URL from the urlString
            let session = URLSession(configuration: .default) // Creating URLSession object
            let task = session.dataTask(with: url) { (data, response, error) in // Creating a data task to retrieve data from the server
                if error != nil {
                    self.delegate?.didFailedWithError(error: error!) // Notify delegate that request failed
                    return
                }
                if let safeData = data { // If data is not nil
                    if let codeDataString = String(data: safeData, encoding: .utf8) { // Convert data to string
                        let noSpaceCode = codeDataString
                            .components(separatedBy: .whitespacesAndNewlines) // Split into substrings by whitespace and newlines
                            .joined(separator: "") // Join the substrings into a single string with no space
                        
                        
                        // Pass the fetched code as a string to the delegate
                        self.delegate?.didUpdateCode(self, fetchedCode: noSpaceCode, gameSettings: gameSettings)
                        
                    } else {
                        print("Failed to convert code data to string.")
                    }
                }
            }
            task.resume() // Start the data task
        }
    }
}
