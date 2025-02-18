func fetchData() async throws -> Data {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }
    return data
}

Task { 
    do {
        let data = try await fetchData()
        // process data
    } catch let error as URLError {
        print("Network error: \(error)")
    } catch {
        print("An unexpected error occurred: \(error)")
    }
} 

//Further Improvements:
//1. Consider using a more specific error type than the generic 'Error' for better error handling.
//2. Instead of just printing errors, you might want to handle them more gracefully (e.g., by displaying an error message to the user or retrying the operation). 
//3. Add logging for better debugging and monitoring.