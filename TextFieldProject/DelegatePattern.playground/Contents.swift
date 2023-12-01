import UIKit

protocol RemoteControlDelegate {
    func channelUp()
    func channelDown()
}

// 리모콘 클래스 (텍스트필드의 역할 - 직접적으로 유저와 커뮤니케이션)
class RemoteControl {
    var delegate: RemoteControlDelegate?
    
    func doSomething() {
        print("리모콘의 조작이 일어나고 있음")
    }
    
    func channelUp() {
        delegate?.channelUp()
    }
    
    func channelDown() {
        delegate?.channelDown()
    }
}

// TV 클래스 (뷰컨트롤러의 역할 - 리모콘과 커뮤니케이션)
class TV: RemoteControlDelegate {
    
    func channelUp() {
        print("TV의 채널이 올라감")
    }
    
    func channelDown() {
        print("TV의 채널이 내려감 ")
    }
    
}

let remote = RemoteControl()
let samsungTV = TV()

remote.delegate = samsungTV

remote.channelUp() // "TV의 채널이 올라감

class SmartPhone: RemoteControlDelegate {
    init(remote: RemoteControl) {
        remote.delegate = self
    }
    
    func channelUp() {
        print("스마트폰 채널이 올라감")
    }
    
    func channelDown() {
        print("스마트폰 채널이 내려감 ")
    }
}

let iPhone = SmartPhone(remote: remote)
remote.channelUp()
