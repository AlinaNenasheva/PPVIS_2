import UIKit

class AuthorizationWindow: UIViewController {
    
    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    var mainMenuWindow = MainMenuWindow()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainMenuWindow = storyboard?.instantiateViewController(identifier: String(describing: MainMenuWindow.self)) as! MainMenuWindow
        passwordTextField.isSecureTextEntry = true
    }
    
    func getPasswordTextField()-> String {
        return passwordTextField.text ?? ""
    }
    
    func getLoginTextField()-> String {
        return loginTextField.text ?? ""
    }
    
    private var submitButtonHandler: (() -> ())?
      
      func setSubmitButtonHandler(_ handler: @escaping () -> ()) {
          submitButtonHandler = handler
      }
      
      @IBAction func submitButtonPressed(_ sender: Any) {
          submitButtonHandler?()
      }

    
    func presentMainMenu() {
        present(mainMenuWindow, animated: true)
    }
}



