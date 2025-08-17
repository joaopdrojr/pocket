# Pocket 🎒

![iOS](https://img.shields.io/badge/iOS-17.0+-blue)
![Swift](https://img.shields.io/badge/Swift-5.9-orange)
![Xcode](https://img.shields.io/badge/Xcode-15.0+-blue)

A modern iOS application for personal item management, built with SwiftUI and App Intents integration for voice control via Siri.

## 📱 About the Project

Pocket is an item management app that allows users to organize their belongings in a simple way. The key differentiator is the complete integration with Siri Shortcuts, enabling full voice control.

## ✨ Key Features

- 🎒 **Item Management**: Add, remove, and mark items as completed
- 🗣️ **Voice Control**: Complete Siri integration with natural commands
- 💾 **Auto-Save**: Persistent storage with UserDefaults
- 🎨 **Modern UI**: Clean SwiftUI design with smooth animations
- 📱 **Adaptive Interface**: Responsive design that adapts to different states

## 🛠 Technologies Used

- **SwiftUI**: Declarative user interface
- **App Intents**: Siri and Shortcuts integration
- **MVVM**: Model-View-ViewModel architecture
- **UserDefaults**: Local data persistence
- **Combine**: Reactive state management

## 🏗 Architecture

```
AppIntentsDemo/
├── App Intents/           # Siri Intents
│   ├── AddItemIntent.swift
│   ├── RemoveItemIntent.swift
│   ├── CheckItemIntent.swift
│   └── ItemEntity.swift
├── Model/                 # Data models
│   └── ItemModel.swift
├── View/                  # SwiftUI interfaces
│   ├── ListView.swift
│   ├── AddView.swift
│   ├── ItemListRowView.swift
│   └── NoItemsView.swift
├── ViewModel/             # Business logic
│   └── ListViewModel.swift
└── AppIntentsDemoApp.swift # Main app
```

### MVVM Pattern Implementation

- **Model**: `ItemModel` - Item data structure
- **View**: SwiftUI components for interface
- **ViewModel**: `ListViewModel` - State management and logic

## 🎯 App Intents - Voice Control

### Available Siri Commands

> **📋 Prerequisite**: Make sure Siri is set to **English** for proper command functionality.

1. **Add Item**
 *"Hey Siri, add item to pocket"*
 
2. **Remove Item**
  *"Hey Siri, remove item from pocket"*

3. **Mark as Completed**
   *"Hey Siri, mark item as done"*

4. **Mark as Pending**
  *"Hey Siri, mark item as pending"*

### Technical Implementation

```swift
struct AddItemIntent: AppIntent {
    static var title: LocalizedStringResource = "Add Item to Pocket"
    static var openAppWhenRun: Bool = false
    
    @Parameter(title: "Item Name")
    var itemName: String
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        guard !itemName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            throw $itemName.needsValueError("Please provide an item name")
        }
        
        ListViewModel.shared.addItemViaIntent(name: itemName)
        return .result(dialog: "Added '\(itemName)' to your pocket!")
    }
}
```

## 🚀 How to Run

### Prerequisites

- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+

### Installation and Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/joaopdrojr/pocket
   cd pocket-app
   ```

2. **Open in Xcode**
   - Open `pocket.xcodeproj`
   - Select your development team in "Signing & Capabilities"

3. **Build and Run**
   - Run on iOS physical device
   - Press ⌘ + R to build and run

### Siri Shortcuts Setup

> **⚠️ Important**: To use voice commands, **Siri must be configured in English**. Go to Settings > Siri & Search > Language and select "English".

**Shortcuts App**
1. Open the **Shortcuts** app
2. Tap the **"+"** button to add a new shortcut
3. Search for **"Pocket"** or **"AppIntentsDemo"**
4. Choose which shortcut to add
5. Test with voice commands

## 📋 Detailed Features

### Main Interface (ListView)

- **Item List**: Displays all items with visual completion state
- **Edit Button**: Enables reordering and deleting items via swipe
- **Add Navigation**: Quick access button for creating new items
- **Tap to Complete**: Simple tap interaction to toggle item status

### Add Items (AddView)

- **Input Validation**: Comprehensive validation preventing empty items
- **Visual Feedback**: Clear alerts to guide user interaction
- **Auto-dismiss**: Smooth navigation back to main list after saving

### Interface States

- **Empty List**: Engaging `NoItemsView` with call-to-action
- **Populated List**: Full-featured `ListView` with all controls
- **Loading States**: Responsive visual feedback during operations

## 🔧 Technical Details

### State Management

```swift
class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet { saveItems() }
    }
    
    // Singleton pattern for App Intents integration
    static let shared = ListViewModel()
    
    // Intent-specific methods
    func addItemViaIntent(name: String) {
        addItems(title: name)
    }
}
```

### Data Persistence

- **UserDefaults**: Simple and effective local storage solution
- **JSON Encoding**: Automatic data serialization with Codable
- **Auto-save**: Data persisted automatically on every change

### Error Handling

- **Input Validation**: Comprehensive prevention of invalid data states
- **User Feedback**: Clear, informative alerts for user guidance
- **Intent Validation**: Robust error handling in Siri command processing

## 🎨 Design System

### Color Scheme

- **Primary Color**: `Color.main` (custom color)
- **Status Colors**: Green for completed items, empty circle for pending
- **Backgrounds**: System-adaptive colors supporting light/dark modes

### Reusable Components

- `ItemListRowView`: Consistent list item presentation with state indicators
- `NoItemsView`: Engaging empty state with clear call-to-action
- Custom styling with consistent spacing and typography

## 🧪 Manual Testing Guide

### Basic Workflow Testing

1. **Add Item Flow**
   - Tap "Add" navigation button
   - Enter item name in text field
   - Tap "Save" to confirm
   - Verify item appears in main list

2. **Complete Item Flow**
   - Tap circle icon next to any item
   - Verify visual state change (green checkmark)
   - Tap again to toggle back to pending state

3. **Siri Integration Testing**
   - Say: *"Hey Siri, add headphones to pocket"*
   - Verify item appears in list with correct name
   - Test removal: *"Hey Siri, remove headphones from pocket"*

4. **List Management**
   - Swipe left on item to reveal delete option
   - Use "Edit" button for bulk operations
   - Test drag-to-reorder functionality

## 🎯 Skills Demonstrated

This project showcases advanced proficiency in:

- **Modern SwiftUI Development**: Declarative UI patterns and state management
- **App Intents Integration**: Cutting-edge Siri and Shortcuts framework
- **MVVM Architecture**: Clean separation of concerns and testable code structure
- **Data Persistence**: Effective local storage strategies
- **User Experience Design**: Intuitive interface with adaptive states
- **iOS Development Best Practices**: Error handling, validation, and code organization

## 📊 Code Quality Highlights

### Architecture Benefits
- **Separation of Concerns**: Well-defined MVVM structure with clear responsibilities
- **Reactive Programming**: Effective use of Combine framework for state management
- **Singleton Pattern**: Proper implementation for App Intents shared access
- **Error Handling**: Comprehensive validation and user feedback systems

### SwiftUI Mastery
- **Declarative UI**: Modern SwiftUI patterns and best practices
- **State Management**: Proper use of @Published, @ObservableObject, and @StateObject
- **Navigation**: Seamless programmatic and user-driven navigation flows
- **Animations**: Smooth transitions and interactive feedback

### App Intents Expertise
- **Voice Command Processing**: Natural language integration with Siri
- **Parameter Handling**: Robust input validation and error messaging
- **Entity Management**: Proper EntityQuery implementation for item selection
- **Shortcut Configuration**: Complete integration with iOS Shortcuts app

## 📄 License

This project is developed for portfolio and technical demonstration purposes.

## 👨‍💻 Developer

**João Pedro**

Connect with me:
- 💼 [LinkedIn](https://linkedin.com/in/joaopdrojr) 
- 🌐 [Portfolio](http://joaopdrojr.framer.website)
- 📸 [Instagram](https://www.instagram.com/joaopdro.dev/)

---
