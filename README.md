**News Reader iOS App**

Welcome to the News Reader iOS App! This is a simple yet powerful app that allows users to read the latest news from various sources. 
Built using SwiftUI, Combine Framework, and MVVM Architecture, this app demonstrates modern iOS development techniques while offering an intuitive and seamless user experience.


**Features:**
News Feed: Get the latest headlines and news articles from multiple sources.
Categories: Browse news by different categories like World, Sports, Technology, and more.
Detailed View: Read detailed news articles by selecting any item from the list.
Dynamic Updates: Using Combine, the app automatically fetches the latest news and updates the UI reactively.

**Architecture**
This app follows the MVVM (Model-View-ViewModel) architecture pattern:
Model: Represents the data (e.g., news articles, categories) and business logic.
View: SwiftUI views that define the UI of the app.
ViewModel: Acts as a bridge between the Model and View, managing the state and business logic using the Combine Framework.


**Technologies Used**
SwiftUI: To build the user interface.
Combine Framework: For handling asynchronous data streams and managing state updates reactively.
MVVM Architecture: To separate concerns and improve testability and scalability.
URLSession: To fetch news articles from an external API.

**Setup Instructions**
**Clone the repository:**
bash
git clone https://github.com/yourusername/NewsReaderApp.git
Open the project in Xcode:
bash
open NewsReaderApp.xcodeproj
Build and run the app on the iOS simulator or a real device.

**Testing**
This app includes unit tests to ensure the app behaves as expected. You can run the tests using the Xcode test navigator.

**Tests:**
Unit Tests: Validate data models, ViewModel logic, and API responses.
Open the project in Xcode.
Navigate to the Product menu and select Test.

**License**
This project is licensed under the MIT License - see the LICENSE file for details.

**Contributing**
Feel free to fork the repository, open issues, or submit pull requests if you'd like to contribute to this project. Contributions are always welcome!

**Contact**
For any inquiries, feel free to reach out to me at:
Email: siddharthadhvaryu@gmail.com

Happy coding and happy reading! 📚
