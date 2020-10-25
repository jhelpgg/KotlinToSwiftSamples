class IllegalArgumentException : Error, CustomStringConvertible {

	public let message : String
	
	init(_ message:String)
	{
		self.message = message
	}

	var description : String { return "IllegalArgumentException : \(self.message)" }
}
