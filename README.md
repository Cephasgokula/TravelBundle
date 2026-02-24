# ✈️ TravelBundle — AI-Powered Travel Bundle Backend

> A smart **Spring Boot REST API** that intelligently bundles **flights + hotels** based on user budget, travel class, and destination — scoring each bundle by value to surface the best deals first.

---

## 🚀 Features

- 🔐 **JWT Authentication** — Secure login & registration with token-based auth
- 📦 **Smart Bundle Engine** — Automatically matches flights + hotels within a user's budget
- 🏆 **Value Scoring Algorithm** — Ranks bundles based on hotel rating, total cost, and budget efficiency
- 🌍 **Destination, Flight & Hotel Management** — Full CRUD-ready entity layer via Spring Data JPA
- 🛡️ **Spring Security** — Protected endpoints with role-aware access control
- 🌐 **CORS Configured** — Ready for frontend integration
- 🗄️ **PostgreSQL** — Production-grade relational database
- 🧹 **Lombok** — Boilerplate-free entity and service code

---

## 🛠️ Tech Stack

| Layer       | Technology                          |
| ----------- | ----------------------------------- |
| Language    | Java 17                             |
| Framework   | Spring Boot 3.2.5                   |
| Security    | Spring Security + JWT (JJWT 0.11.5) |
| Persistence | Spring Data JPA + Hibernate         |
| Database    | PostgreSQL                          |
| Build Tool  | Maven                               |
| Utilities   | Lombok, Spring Boot DevTools        |

---

## 📁 Project Structure

```
TravelBundle/
├── src/
│   └── main/
│       └── java/com/example/TravelBundle/
│           ├── auth/              # JWT Auth (Controller, Service, Filter, Utils)
│           ├── bundle/            # Bundle Engine (Controller, Service, DTOs, Entity)
│           ├── config/            # Security & CORS Configuration
│           ├── destination/       # Destination Entity, Controller, Repository
│           ├── flight/            # Flight Entity, Controller, Repository
│           ├── hotel/             # Hotel Entity, Controller, Repository
│           └── user/              # User Entity, Controller, Repository
├── frontend/
│   └── index.html                 # Minimal HTML frontend for testing
├── pom.xml
└── README.md
```

---

## ⚙️ Getting Started

### Prerequisites

- Java 17+
- Maven 3.8+
- PostgreSQL (running locally or via Docker)

### 1. Clone the Repository

```bash
git clone https://github.com/Cephasgokula/TravelBundle.git
cd TravelBundle
```

### 2. Configure the Database

Edit `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/travelbundle
spring.datasource.username=your_db_user
spring.datasource.password=your_db_password
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```

### 3. Run the Application

```bash
./mvnw spring-boot:run
```

The server will start at **`http://localhost:8080`**.

---

## 🔌 API Endpoints

### 🔐 Auth

| Method | Endpoint             | Description           | Auth Required |
| ------ | -------------------- | --------------------- | ------------- |
| POST   | `/api/auth/register` | Register a new user   | ❌            |
| POST   | `/api/auth/login`    | Login and receive JWT | ❌            |

#### Register Request

```json
{
  "name": "Gokul",
  "email": "gokul@example.com",
  "password": "yourpassword"
}
```

#### Login Request

```json
{
  "email": "gokul@example.com",
  "password": "yourpassword"
}
```

#### Login Response

```json
{
  "token": "eyJhbGciOiJIUzI1NiJ9..."
}
```

---

### 📦 Bundle Search

| Method | Endpoint              | Description                    | Auth Required |
| ------ | --------------------- | ------------------------------ | ------------- |
| POST   | `/api/bundles/search` | Search and rank travel bundles | ✅ JWT        |

#### Bundle Search Request

```json
{
  "destination": "Paris",
  "departureDate": "2025-06-01T00:00:00",
  "returnDate": "2025-06-08T00:00:00",
  "budget": 2000.0,
  "travelClass": "ECONOMY"
}
```

#### Bundle Search Response

```json
{
  "searchedBy": "gokul@example.com",
  "result": {
    "destination": "Paris",
    "tripDurationNights": 7,
    "totalBundlesFound": 12,
    "bundles": [
      {
        "rank": 1,
        "flight": {
          "airline": "Air France",
          "travelClass": "ECONOMY",
          "flightPrice": 450.0
        },
        "hotel": {
          "name": "Hotel Lumière",
          "pricePerNight": 120.0,
          "totalHotelCost": 840.0,
          "rating": 4.5
        },
        "totalBundlePrice": 1290.0,
        "budgetRemaining": 710.0,
        "valueScore": 3.49
      }
    ]
  }
}
```

> **Note:** Use the JWT token from login in the `Authorization` header:
>
> ```
> Authorization: Bearer <your_token>
> ```

---

### 🌍 Other Endpoints

| Method | Endpoint            | Description           |
| ------ | ------------------- | --------------------- |
| GET    | `/api/destinations` | List all destinations |
| GET    | `/api/flights`      | List all flights      |
| GET    | `/api/hotels`       | List all hotels       |
| GET    | `/api/users`        | List all users        |

---

## 🧠 Bundle Value Score Algorithm

Each bundle is ranked using a **Value Score** calculated as:

```
valueScore = (hotelRating / totalBundlePrice) × 1000
           + (budgetRemaining / userBudget × 2)
```

- **Higher hotel rating** → higher score
- **Lower total price** → higher score
- **More budget remaining** → bonus points

The top **5 bundles** by value score are returned, ranked 1–5.

---

## 🌐 Frontend

A minimal HTML frontend is included at `frontend/index.html` for quick API testing. It supports:

- User login & registration
- Bundle search with form inputs
- Displaying ranked bundle results

Open `frontend/index.html` directly in a browser (ensure CORS is configured for your origin).

---

## 🔒 Security Notes

- JWT tokens are signed with a secret key configured in `application.properties`
- All `/api/bundles/**` routes require a valid Bearer token
- Passwords are encrypted using **BCrypt**

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👤 Author

**Gokul** — [@Cephasgokula](https://github.com/Cephasgokula)
