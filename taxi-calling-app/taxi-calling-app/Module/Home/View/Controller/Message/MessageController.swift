import UIKit
import SnapKit

class MessageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    private let messageInputView = UIView()
    private let messageTextField = UITextField()
    private let sendButton = UIButton()
    
    private var messages: [(String, Bool)] = [
        ("Hello! How can I assist you today?", false),
        ("I need some help with my project.", true),
        ("Sure! What do you need help with?", false)
    ]
    
    var chatTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupKeyboardObservers()
        
        self.title = chatTitle
        
        // Hide tab bar when MessageController is pushed
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Remove keyboard observers
        NotificationCenter.default.removeObserver(self)
        // Show tab bar again when going back
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            messageInputView.snp.updateConstraints { make in
                make.bottom.equalTo(view.safeAreaLayoutGuide).inset(keyboardSize.height)
            }
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        messageInputView.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.background
        title = "Chat"
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // TableView Setup
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.background
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(60)
        }
        
        // Message Input View Setup
        messageInputView.backgroundColor = .darkGray
        messageInputView.layer.cornerRadius = 16
        messageInputView.clipsToBounds = true
        view.addSubview(messageInputView)
        
        messageInputView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        // Message TextField Setup
        messageTextField.borderStyle = .none
        messageTextField.backgroundColor = .darkGray
        messageTextField.textColor = .white
        messageTextField.attributedPlaceholder = NSAttributedString(
            string: "Type a message...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        messageTextField.layer.cornerRadius = 16
        messageTextField.clipsToBounds = true
        messageInputView.addSubview(messageTextField)
        
        messageTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(60)
            make.height.equalTo(40)
        }
        
        // Send Button Setup
        sendButton.setTitle("Send", for: .normal)
        sendButton.setTitleColor(.systemBlue, for: .normal)
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        messageInputView.addSubview(sendButton)
        
        sendButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc private func sendMessage() {
        guard let text = messageTextField.text, !text.isEmpty else { return }
        messages.append((text, true))
        tableView.reloadData()
        messageTextField.text = ""
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    // UITableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatMessageCell
        let message = messages[indexPath.row]
        cell.configure(with: message.0, isUserMessage: message.1)
        return cell
    }
}

class ChatMessageCell: UITableViewCell {
    private let messageLabel = UILabel()
    private let bubbleView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = Colors.background
        contentView.backgroundColor = Colors.background
        bubbleView.layer.cornerRadius = 16
        bubbleView.clipsToBounds = true
        addSubview(bubbleView)
        
        messageLabel.numberOfLines = 0
        bubbleView.addSubview(messageLabel)
    }
    
    func configure(with text: String, isUserMessage: Bool) {
        messageLabel.text = text
        
        if isUserMessage {
            bubbleView.backgroundColor = UIColor.systemBlue
            messageLabel.textColor = .white
            
            bubbleView.snp.remakeConstraints { make in
                make.right.equalToSuperview().inset(10)
                make.top.bottom.equalToSuperview().inset(5)
                make.width.lessThanOrEqualTo(250)
            }
        } else {
            bubbleView.backgroundColor = UIColor.darkGray
            messageLabel.textColor = .white
            
            bubbleView.snp.remakeConstraints { make in
                make.left.equalToSuperview().offset(10)
                make.top.bottom.equalToSuperview().inset(5)
                make.width.lessThanOrEqualTo(250)
            }
        }
        
        messageLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
}
