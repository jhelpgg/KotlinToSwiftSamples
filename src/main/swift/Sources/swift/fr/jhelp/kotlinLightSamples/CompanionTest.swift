
class CompanionTest {

    
        static var before = "before"

        /**
         * Wonderful world }}}}
         */
        static func staticMethod()
        {
            let k = "}"
            print("static {{{{{ \(k)")
        }

        // ploki { {{{{

        static let after = "after"
    

    func instanceMethod()
    {
        let l = "\n"
        let m = "\u{00af}"
        print("instance \(l) hh \(m) pp")
    }
}
