//
//  ReachabilityNetwork.swift
//  SportsTime
//
//  Created by raneem on 30/04/2024.
//

import Foundation
import Reachability

class ReachabilityNetwork{
    static let shared = ApiServices.shared

    private let reachability = try! Reachability()
    
    var isNetworkAvailable: Bool {
        return reachability.connection != .unavailable
    }
        private init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNetworkChange(_:)), name: .reachabilityChanged, object: reachability)
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Failed to start reachability notifier")
        }
    }
    
    @objc private func handleNetworkChange(_ notification: Notification) {
        if isNetworkAvailable {
            print("Network is available")
        } else {
            print("Network is unavailable")
        }
    }
}
