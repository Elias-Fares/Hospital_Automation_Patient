# 🏥 Hospital Automation – Patient App

A Flutter-based mobile application designed to streamline clinic operations by helping patients efficiently manage their appointments and vaccination schedules. The app empowers users to avoid long waiting times, access accurate healthcare information, and stay informed about their own and their children’s medical records.

---

## 📱 Features

### 👤 Account Management
- Create a new account using an email address.  
- Sign in using personal credentials.  
- Manage profile information.  
- Log out securely.

### 🏥 Clinic Information
- View a list of available medical departments.  
- Browse doctors within each department, including name, specialty, and work schedule.

### 📅 Appointment Booking
- Choose a medical department and book an appointment with an available doctor.  
- Select a convenient date and time from available slots.  
- View a list of booked appointments.

### 🩺 Medical Records
- Access summaries of past clinic visits.  
- View diagnoses and prescriptions linked to each visit.

### 👶 Children Management
- Access and manage children’s profiles including medical history, visits, and vaccination schedules.

### 💉 Vaccination Scheduling
- Book vaccination appointments for children directly through the schedule.

### 🔍 Search & Filters
- Search for doctors by name or specialty.  
- Filter booked appointments by status, date, person, or child’s name.

### 🔔 Notifications
- Receive reminders for upcoming appointments and vaccinations.

---

## 🧠 Architecture

The project follows a **feature-based MVVM architecture** with separation of layers for scalability and maintainability.

### 🧩 State Management
Implemented using **Riverpod**, providing reactive and type-safe state handling across modules.

### 🌐 Networking
The app communicates with a **RESTful API** using **Dio** for HTTP requests and response handling.

#### Response Structure

**✅ Success**
```dart
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data);
}
```

**❌ Failure**
```dart
class DataFailed<T> extends DataState<T> {
  const DataFailed(ExceptionResponse error);
}
```

#### 🧱 Error Handling
Centralized in:
- `lib/core/base_dio/exception_handler.dart`
- `lib/core/base_dio/data_state.dart`

Includes:
- Unified `ExceptionResponse` class  
- Localized error codes for:
  - No internet connection  
  - Timeout  
  - Request cancelled  
  - Certificate errors  
  - Unknown issues  

Example:
```dart
switch (dioException.type) {
  case DioExceptionType.receiveTimeout:
    return ExceptionResponse(statusCode: -3, exceptionMessages: ["Receive timeout"]);
}
```

All handled errors propagate through `DataFailed` and can be displayed elegantly in the UI.

---

## 🔥 Tech Stack

| Category | Technology |
|-----------|-------------|
| Framework | Flutter |
| Architecture | MVVM (Feature-based) |
| State Management | Riverpod |
| Networking | Dio |
| Backend | RESTful API |
| Cloud Services | Firebase |
| Error Handling | Custom DataState + ExceptionResponse |

---

## ⚙️ Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/hospital-automation-patient-app.git
cd hospital-automation-patient-app
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure Firebase
Ensure Firebase is configured with the appropriate project settings (Google Services JSON for Android and plist for iOS).

### 4. Run the App
```bash
flutter run
```

---

## 🧩 Folder Structure (Simplified)
```
lib/
│
├── core/
│   ├── base_dio/
│   └── constant/
│
├── configuration/
│   ├── router/
│   └── res.dart
│
├── data/
│   ├── auth/
│   ├── children/
│   └── vaccination/
│
├── features/
│   ├── app/
│   ├── login/
│   ├── appointments/
│   ├── medical_records/
│   └── vaccination/
│
└── main.dart
```

---

## 🚀 Future Improvements
- Multi-language support (Arabic & English).  
- Integration with wearable health devices.  

---

## 📄 License
This project is proprietary and not publicly licensed.  
(You can modify this section later if you decide to add a license.)

---

**Developed with ❤️ using Flutter & Riverpod**
