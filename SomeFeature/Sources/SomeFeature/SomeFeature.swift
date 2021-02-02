import Alamofire
public struct SomeFeature {
    public var text = "Hello, World!"
    public init(text:String = "hi SomeFeature") {
        self.text = text
    }
    public func testAlamofire() -> Void {
        Alamofire.Session.default.request("http://61.143.224.166:8071/phone/servertimeios").response { responseData in
            guard let data = responseData.data else { return }
            guard let time = String(data: data, encoding: .utf8) else{return}
            debugPrint("SomeFeature->testAlamofire() :",time)
        }
    }
}
