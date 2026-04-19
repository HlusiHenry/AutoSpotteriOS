import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var spotService: SpotService
    @StateObject var settings = AppSettings()
    
    @State private var backupCode = ""
    @State private var showBackupAlert = false
    @State private var showRestoreAlert = false
    @State private var showResetAlert = false
    @State private var restoreSuccess = false
    
    let colors = [
        ("Racing Yellow", "#E8C547"),
        ("Rosso Corsa", "#FF3B30"),
        ("Electric Blue", "#007AFF"),
        ("Racing Green", "#006644"),
        ("Stealth Gray", "#8E8E93")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Design & Feeling")) {
                    Picker("Akzentfarbe", selection: $settings.accentColorHex) {
                        ForEach(colors, id: \.1) { color in
                            Text(color.0).tag(color.1)
                        }
                    }
                    
                    Toggle("Haptisches Feedback", isOn: $settings.hapticsEnabled)
                }
                
                Section(header: Text("Backup & Daten")) {
                    Button(action: {
                        let code = spotService.createBackupString()
                        UIPasteboard.general.string = code
                        showBackupAlert = true
                    }) {
                        Label("Fortschritt kopieren (Backup)", systemImage: "doc.on.doc")
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Backup wiederherstellen").font(.subheadline)
                        TextField("Backup-Code hier einfügen...", text: $backupCode)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                        Button(action: {
                            if spotService.restoreFromBackup(code: backupCode) {
                                restoreSuccess = true
                                backupCode = ""
                            }
                            showRestoreAlert = true
                        }) {
                            Text("Wiederherstellen")
                                .fontWeight(.bold)
                                .foregroundColor(settings.accentColor)
                        }
                        .disabled(backupCode.isEmpty)
                    }
                    .padding(.vertical, 5)
                }
                
                Section(header: Text("Gefahrenzone"), footer: Text("Vorsicht: Das Löschen kann nicht rückgängig gemacht werden.")) {
                    Button(action: { showResetAlert = true }) {
                        Label("Alle Spots & Punkte löschen", systemImage: "trash")
                            .foregroundColor(.red)
                    }
                }
                
                Section(header: Text("Über AutoSpotter")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.3.0").foregroundColor(.gray)
                    }
                    HStack {
                        Text("Datenbank")
                        Spacer()
                        Text("\(allCars.count) Autos").foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Einstellungen")
            .alert(isPresented: $showBackupAlert) {
                Alert(title: Text("Backup erstellt"), message: Text("Dein Fortschritts-Code wurde in die Zwischenablage kopiert. Speichere ihn gut ab!"), dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $showRestoreAlert) {
                Alert(title: Text(restoreSuccess ? "Erfolg!" : "Fehler"), message: Text(restoreSuccess ? "Dein Fortschritt wurde erfolgreich wiederhergestellt." : "Der Code ist ungültig. Bitte prüfe ihn nochmal."), dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $showResetAlert) {
                Alert(
                    title: Text("Alles löschen?"),
                    message: Text("Willst du wirklich alle deine gesammelten Autos und Punkte löschen?"),
                    primaryButton: .destructive(Text("Löschen")) {
                        spotService.resetAll()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}
