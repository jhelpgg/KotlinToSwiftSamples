class CustomException : Error, CustomStringConvertible {

	public let message : String
	
	init(_ message:String)
	{
		self.message = message
	}

	var description : String { return "CustomException : \(self.message)" }
}
