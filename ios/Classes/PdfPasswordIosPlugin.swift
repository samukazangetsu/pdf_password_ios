import Flutter
import UIKit
import PDFKit

public class PdfPasswordIosPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "pdf_password_ios", binaryMessenger: registrar.messenger())
        
        let instance = PdfPasswordIosPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func verifyPassword(_ call: FlutterMethodCall, result: @escaping FlutterResult) -> Any? {
      
      guard let args = call.arguments as? [String: Any] else {
          return(FlutterError(code: "PATH", message: "Não é um caminho válido", details: nil))
      }
      let path = args["path"] as! String
        let pdf = PDFDocument(url: URL(path))
        if(pdf != nil){
            return pdf?.isLocked
        }
        return(FlutterError(code: "PATH", message: "Não foi encontrado um arquivo", details: nil))
       
  }
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        verifyPassword(call, result: result)
    }
}
