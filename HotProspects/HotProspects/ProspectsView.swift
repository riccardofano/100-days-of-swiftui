//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Riccardo Fano on 2023-09-03.
//

import SwiftUI
import CodeScanner
import UserNotifications

enum FilterType {
    case none, contacted, uncontacted
}

enum SortType {
    case none, name, email
}

struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects;
    
    @State private var isShowingScanner = false
    @State private var isShowingSortingDialog = false
    
    let filter: FilterType
    @State private var sort: SortType = .none
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter {
                $0.isContacted
            }
        case .uncontacted:
            return prospects.people.filter {
                !$0.isContacted
            }
        }
    }
    var sortedProspects: [Prospect] {
        switch sort {
        case .none:
            return filteredProspects
        case .name:
            return filteredProspects.sorted {
                $0.name < $1.name
            }
        case .email:
            return filteredProspects.sorted {
                $0.email < $1.email
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedProspects) { prospect in
                    HStack {
                        if (filter == .none) {
                            Image(systemName:
                                prospect.isContacted
                                    ? "person.crop.circle.fill.badge.checkmark"
                                    : "person.crop.circle.badge.xmark"
                            )
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .padding(.trailing, 5)
                        }
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.email)
                                .foregroundColor(.secondary)
                        }
                    }
                    .swipeActions {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)
                        }
                        Button {
                            addNotification(for: prospect)
                        } label: {
                            Label("Remind Me", systemImage: "bell")
                        }
                        .tint(.orange)
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button {
                    isShowingScanner = true
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
                Button {
                    isShowingSortingDialog = true
                } label: {
                    Label("Sort", systemImage: "slider.horizontal.3")
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "GuyMcGuy\ntest@example.com", completion: handleScan)
            }
            .confirmationDialog("Sort by", isPresented: $isShowingSortingDialog) {
                Button("Sort by name") {
                    sort = .name
                }
                Button("Sort by email") {
                    sort = .email
                }
                Button("Cancel", role: .cancel) {
                    isShowingSortingDialog = false
                }
            }
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            let person = Prospect()
            person.name = details[0]
            person.email = details[1]
            
            prospects.add(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.email
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.hour = 9
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
