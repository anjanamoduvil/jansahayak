<p align="center">
  <img width="1269" height="640" alt="image" src="https://github.com/user-attachments/assets/86970253-360f-47bb-a5e8-475ea5da5da2" />

</p>

# JANASAHAYAK🎯

## Basic Details

### Team Name: CHOTTU BHAI

### Team Members
- Member 1: Anjana M - MACE KOTHAMANGALAM
- Member 2: Ameena R- MACE KOTHAMANGALAM
### project link 

https://drive.google.com/drive/folders/1gYXnbT5t8FerpiwwbFRzyS5PMvoatnGE?usp=drive_link

### Project Description
JanSahayak is a mobile application that simplifies access to government schemes. It provides personalized, relevant government policy recommendations based on user profiles, bridging the information gap for citizens.

### The Problem statement
Many citizens, especially from underserved communities, remain unaware of various government schemes, benefits, and policies they are eligible for due to a lack of accessible, localized information and complex eligibility criteria.

### The Solution


We built an intuitive mobile app that collects basic demographic and professional details from users to curate and recommend relevant government schemes. It provides multilingual support, text-to-speech features, a community forum, and an AI-powered chatbot assistant to make discovering and understanding policies as easy as possible.
---

## Technical Details

### Technologies/Components Used

**For Software:**
 Languages used: Dart
- Frameworks used: Flutter
- Libraries used: `provider` (State Management), `http` (API integration), `flutter_tts` (Text-to-Speech), `translator` (Language Translation), `shared_preferences` (Local storage), `google_fonts` (Typography)
- Tools used: VS Code, Git,  Flutter SDK


---

## Features

List the key features of your project:
- Feature 1: **Personalized Scheme Recommendations:** Tailored government policy suggestions based on the user's profile and demographics.
- Feature 2: **Multilingual :** Helps users understand scheme details in their preferred language with integrated translation .
- Feature 3: **Community Support & Discussion:** A dedicated community screen for users to discuss schemes, ask questions, and share updates.
- Feature 4: **Smart Chatbot Assistant:** An integrated chatbot to handle user queries about various government policies interactively.
---

## Implementation

### For Software:

#### Installation
```bash
# Clone the repository
git clone [https://github.com/anjanamoduvil/jansahayak]

# Navigate to the project directory
cd jansahayak_app

# Install dependencies
flutter pub get
```


#### Run
```bash
# Run the application on a connected device or emulator (Android/Chrome/Edge/Windows)
flutter run
```


## Project Documentation

### For Software:

#### Screenshots 
<img width="384" height="717" alt="image" src="https://github.com/user-attachments/assets/1a3925a8-db15-4688-95dd-c75e34739ca3" />
*THE LOGIN PAGE OF JANSAHAYAK*



<img width="443" height="777" alt="image" src="https://github.com/user-attachments/assets/c972e9db-63c3-4f99-ba9d-ef198a7e8875" />
Based on the details given ,the policies are popped up, Janasahayak is multilingual,so that user can choose their preffered language



<img width="429" height="774" alt="image" src="https://github.com/user-attachments/assets/519462db-dac4-47f8-bc20-9491afa04371" />
An AI assistant user freindly chatbot




<img width="281" height="780" alt="image" src="https://github.com/user-attachments/assets/cd087b34-b446-4b2e-b7fc-4a11045044a7" />
detailed description of selected schema along with its application link 





<img width="435" height="785" alt="image" src="https://github.com/user-attachments/assets/21fe039c-6163-4cf3-841b-898ea8407323" />
         A community page for peer to peer interaction


#### Diagrams

### For Mobile Apps:
<img width="908" height="743" alt="image" src="https://github.com/user-attachments/assets/3956c2ca-a7f2-41aa-85e0-1f08d6dab455" />



#### Demo Output



## Example 1: Scheme Recommendation

Input:
User details:
- Age: 45
- Occupation: Farmer
- Income: Low

Output:
- PM-KISAN Scheme
- Crop Insurance Scheme
- State-level Farmer Subsidy Programs

---

## Example 2: Chatbot Query

User Input:
"What schemes are available for women entrepreneurs?"

Chatbot Output:
- Stand-Up India Scheme
- PM kissan
- Women Entrepreneurship Platform

---

## Example 3: Multilingual Support

User selects: Malayalam

App Output:
All scheme descriptions displayed in Malayalam.
Text-to-speech available.
🎯 Final Answer (Important)

For your hackathon submission:

👉 Delete the CLI/Scripts section completely.
👉 Replace it with a User Flow / App Usage Guide section.

Because judges may get confused if they see Python CLI commands in a Flutter mobile app project.

If you want, I can now:

🔥 Convert your README into a perfect hackathon submission format

🏆 Make it look more professional for judges

📱 Add a clean "User Journey" section

Tell me which one you want 💪

## Project Demo

### Video
https://drive.google.com/drive/folders/1gYXnbT5t8FerpiwwbFRzyS5PMvoatnGE?usp=drive_link

---

## AI Tools Used (Optional - For Transparency Bonus)


**Tool Used:**  Chatgpt,gemini

**Purpose:** 
For generating code

**Key Prompts Used:**
App Overview:
JanSahayak is a multilingual, AI-driven mobile application that helps citizens discover and understand government schemes easily. The app should follow a clean layered architecture with separation of UI, state management, services, and data.

Technical Stack:
- Flutter (latest stable version)
- Dart
- Provider for state management
- Material 3 UI
- Local JSON for data storage
- Google Translate package for multilingual support

Architecture Requirements:
Use a Client-Side Heavy Architecture with modular service layer.

Project Structure:

lib/
 ├── main.dart
 ├── models/
 ├── screens/
 ├── providers/
 ├── services/
 └── assets/data/dummy_schemes.json

Core Features:

1. Home Screen
- Display list of government schemes
- Search bar
- Filter based on occupation or category
- Use SchemeProvider

2. AI Chatbot Screen
- User can type natural language query
- Implement keyword-based matching in PolicyService
- Return relevant schemes
- Display responses using TranslatedText widget
- Support multiple languages

3. User Profile
- Store user name, occupation, selected language
- Managed by UserProfileProvider
- Personalize scheme recommendations

4. Multilingual Support
- Language selection screen
- Store language preference
- TranslatedText widget auto-translates content using TranslationService
- Default language: English

5. State Management (Provider)
Create:
- AuthProvider
- UserProfileProvider
- SchemeProvider

6. Service Layer
- PolicyService: fetch and filter schemes from local JSON
- TranslationService: integrate Google Translate API
- Keep services independent from UI

7. Data Layer
- Load schemes from assets/data/dummy_schemes.json
- Create strong Dart models (Scheme, UserProfile)

UI Requirements:
- Use Material 3
- Clean and accessible UI
- Responsive layouts
- Proper error handling
- Loading indicators
- Modular widgets

Future Scalability:
- Structure code so backend can later be replaced with FastAPI
- Prepare architecture for RAG-based vector search
- Keep chatbot logic replaceable with LLM API

Deliverables:
- Full folder structure
- All Dart files
- Sample dummy_schemes.json
- Proper comments
- Clean code
- Production-ready architecture
**Percentage of AI-generated code:** [70%]


---

## Team Contributions

- [Anjana M]: [Specific contributions - Frontend and backend development]
- [Ameena R]: [Specific contributions - frontend and backend development]



---

Made with ❤️ at TinkerHub
