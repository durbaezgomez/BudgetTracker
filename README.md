# **BudgetTracker**  
### **A SwiftUI Budget App with The Composable Architecture**

---

## **Overview**  

**BudgetTracker** is a simple iOS budget management app designed to help users track expenses and manage their finances effectively. The project is built with **SwiftUI** and leverages **The Composable Architecture (TCA)** to provide a modern, maintainable, and scalable architecture.

---

## **Project Concept**  

The app allows users to:  
- Add, edit, and delete expenses.  
- Categorize expenses by type (e.g., food, travel, others).  
- View spending data in a structured and intuitive interface.  

The primary focus of this project is to learn and implement **TCA**, a state management framework for SwiftUI that promotes predictable and testable code.

---

## **Learning Goals**  

The project aims to:  
1. Understand **state management** and **reducer-based architecture** using TCA.  
2. Build a clean and modular SwiftUI app with:  
   - Features broken into smaller, reusable components.  
   - State-driven UI updates.  
3. Use **local persistence** (e.g., `@Shared` with `FileStorage`) to store and manage user data.  
4. Enhance SwiftUI skills and adopt best practices for building scalable iOS apps.  

---

## **Key Features**  
- **SwiftUI** for building the user interface.  
- **Composable Architecture (TCA)** for predictable state management.  
- **Local Storage** for saving expenses locally on the device.  
- **Reusable Views** to keep the UI modular and clean.  

---

## **Tools & Technologies**  

- [x] **SwiftUI**  
- [x] **Xcode** (latest version)  
- [x] **Swift Package Manager** for dependency management  
- [x] **The Composable Architecture (TCA)**  
- [ ] **Local Persistence** via `@Shared(.fileStorage)`
- [ ] **Swift Charts**

---

## **How to Run**  

1. Clone the repository:  
   ```bash
   git clone <repo-url>
   cd BudgetTracker

2.	Open BudgetTracker.xcodeproj in Xcode.
3.	Build and run the app on the iOS Simulator or a real device.

## **Future Improvements**

- Add analytics and visualization (e.g., charts for expense stats).
- Sync data across devices using iCloud.
- Integrate budget planning features.
- Add support for multiple currencies and localization.
- Improve UI/UX with animations and better accessibility support.

