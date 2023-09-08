import Flutter
import UIKit
import PDFKit

public class PdfPasswordIosPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "pdf_password_ios", binaryMessenger: registrar.messenger())
        
        let instance = PdfPasswordIosPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func verifyPassword(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let args = call.arguments as? [String]
        if(args != nil){
            let path = args![0]
            let pdf = PDFDocument(url: URL(fileURLWithPath: path))

            if(pdf?.documentURL != nil){
                if ((pdf?.documentURL?.startAccessingSecurityScopedResource()) != nil){
                    result(pdf!.isLocked)
                } else {
                    result(FlutterError(code: "PATH", message: "Não foi encontrado um arquivo", details: nil))
                }
                  
              }
            result(FlutterError(code: "PATH", message: "Não foi encontrado um arquivo", details: nil))
        }
      
        result(FlutterError(code: "PATH", message: "Não informado um caminho válido", details: nil))
       
  }
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        verifyPassword(call, result: result)
    }
}
