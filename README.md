# FuelIndeed

> An on-demand fuel delivery platform connecting customers with nearby fuel stations — built with Java Spring MVC, Hibernate ORM, and MySQL.

![Java](https://img.shields.io/badge/Java-11+-orange?style=for-the-badge&logo=openjdk)
![Spring MVC](https://img.shields.io/badge/Spring-MVC-brightgreen?style=for-the-badge&logo=spring)
![Hibernate](https://img.shields.io/badge/Hibernate-ORM-brown?style=for-the-badge&logo=hibernate)
![MySQL](https://img.shields.io/badge/MySQL-Database-blue?style=for-the-badge&logo=mysql)
![Tomcat](https://img.shields.io/badge/Tomcat-Servlet%20Container-yellow?style=for-the-badge&logo=apachetomcat)
![Status](https://img.shields.io/badge/Status-Learning%20Prototype-purple?style=for-the-badge)

---

# About The Project

FuelIndeed is a multi-role web application that simulates the backend and frontend of an on-demand fuel delivery marketplace.

Inspired by the operational complexity of logistics platforms, the system manages the complete lifecycle of a fuel booking:

- Customer places an order
- Fuel station accepts/rejects booking
- Delivery person handles delivery
- Customer verifies delivery through a one-time code

The platform supports four distinct actor types:

| Role | Responsibilities |
|---|---|
| **Admin** | Approves/rejects fuel stations and manages platform users |
| **Fuel Station** | Manages inventory, accepts bookings, assigns delivery personnel |
| **Delivery Person** | Views assigned bookings and verifies delivery completion |
| **End User** | Searches nearby stations, books fuel, tracks order status |

---

## Engineering Goals

This project was built to explore:

- Spring MVC architecture without Spring Boot abstraction
- Multi-role authentication flows
- Relational schema modeling
- ORM-based persistence with Hibernate
- Booking state machine implementation
- Server-side rendering using JSP
- Session-based authentication workflows

---

# Project Type

Learning-Oriented Full Stack Web Application — built using Java Spring MVC, Hibernate ORM, JSP, and MySQL as a hands-on exploration of servlet container architecture, MVC routing, ORM persistence, session-based authentication, multi-role system design, and traditional server-side rendered Java web application development.

---

# Project Status

**Learning Prototype / Engineering Exploration**

This is a working prototype built primarily for:

- Learning Spring MVC internals
- Understanding Hibernate ORM
- Exploring server-side Java web architecture
- Practicing multi-role application design

The repository is intentionally preserved as a learning artifact with documented architectural limitations and security considerations.

---

# Why I Built This

I built this project to gain practical experience with the Spring Framework by working on a system more complex than a basic CRUD application.

The project helped me explore:

- Spring MVC request lifecycle
- Hibernate ORM integration
- Session-based authentication
- Multi-role application architecture
- JSP-based server-side rendering
- Traditional Java web application development without relying heavily on Spring Boot abstractions

# Features

## Core Application Features

- Multi-role registration and login
- Station approval workflow
- Fuel inventory management
- Fuel booking with bill calculation
- Booking lifecycle state machine
- Delivery person assignment
- Delivery verification code system
- Delivery personnel management
- Station search by address fragment
- Role-specific dashboards

---

## Engineering Features

- Hibernate ORM with `@Enumerated(EnumType.STRING)`
- HQL named-parameter queries
- Spring MVC `@Controller` routing
- JSP server-side rendering
- Session-scoped authentication
- jQuery DataTables integration

---

## UI Features

- Responsive dashboard layouts
- Booking status badge system
- Modal-based interactions
- Password strength indicators
- Animated landing page sections

---

# Tech Stack

## Backend

| Technology | Version | Purpose |
|---|---|---|
| Java | 11+ | Core application language |
| Spring MVC | 5.2.4 | MVC framework |
| Spring ORM | 5.2.3 | Hibernate integration |
| Spring Context | 5.2.3 | IoC container |
| Hibernate Core | 5.4.2 | ORM and persistence |
| MySQL Connector/J | 8.0.33 | JDBC communication |

---

## Frontend

| Technology | Purpose |
|---|---|
| JSP | Server-side rendering |
| HTML5 / CSS3 | Layout and styling |
| Vanilla JavaScript | Client-side interactions |
| jQuery | DOM manipulation |
| jQuery DataTables | Dashboard tables |
| Font Awesome | Icons |
| Google Fonts | Typography |

---

## Database

| Technology | Purpose |
|---|---|
| MySQL 8.0 | Relational database |
| Hibernate DDL | Schema generation |
| JDBC | Database communication |

---

# Architecture

FuelIndeed follows a traditional MVC architecture with a DAO persistence layer.

```text
Browser (JSP Views)
        │
        ▼
Apache Tomcat
(Servlet Container)
        │
        ▼
DispatcherServlet
(Spring MVC)
        │
        ▼
@Controller Classes
        │
        ▼
DAO Layer
        │
        ▼
Hibernate SessionFactory
        │
        ▼
MySQL Database
```

---

## Booking Lifecycle State Machine

```text
New Booking
     │
     ▼
 PENDING
     │
 ┌───┴─────────────┐
 ▼                 ▼
ASSIGNED       REJECTED
    │
    ▼
DELIVERED
```

---

## Role Interaction Flow

```text
Admin
 └── Approves / Rejects Stations

User
 └── Searches Stations → Books Fuel

Station
 └── Accepts Booking → Assigns Delivery Person

Delivery Person
 └── Verifies Delivery Code → Marks Delivered
```

---

# Folder Structure

```text
fuelindeed/
├── pom.xml
│
└── src/
    └── main/
        ├── java/
        │   └── com/heramb/
        │       ├── controller/
        │       ├── dao/
        │       ├── enums/
        │       ├── model/
        │       └── config.xml
        │
        └── webapp/
            ├── WEB-INF/
            │   ├── web.xml
            │   ├── spring-servlet.xml
            │   └── views/
            │
            └── resources/
                ├── css/
                ├── js/
                └── assets/
```

---

# Installation

## Prerequisites

- Java 11+
- Apache Maven 3.6+
- Apache Tomcat 9.x
- MySQL 8.0

---

## Clone Repository

```bash
git clone https://github.com/your-username/fuelindeed.git
cd fuelindeed
```

---

## Create Database

```sql
CREATE DATABASE fuelindeed;
```

---

## Configure Database Credentials

Update:

```text
src/main/java/config.xml
```

---

## Build WAR

```bash
mvn clean package
```

---

## Deploy to Tomcat

Copy generated WAR:

```text
target/day4_springmvc.war
```

to:

```text
<TOMCAT_HOME>/webapps/
```

---

## Access Application

```text
http://localhost:8080/day4_springmvc/
```

---

# Usage

## Admin Flow

- Login as admin
- Approve/reject stations
- Manage users

---

## Station Flow

- Register station
- Wait for approval
- Manage inventory
- Assign delivery personnel

---

## User Flow

- Register/login
- Search stations
- Book fuel
- Track bookings
- Share delivery code

---

## Delivery Person Flow

- Login
- View assigned bookings
- Verify delivery code
- Mark bookings delivered

---

# API Reference

## Authentication

| Method | Endpoint | Description |
|---|---|---|
| GET | `/adminLogin` | Admin login page |
| POST | `/AdminLogin` | Admin authentication |
| GET | `/userLogin` | User login page |
| POST | `/UserLogin` | User authentication |

---

## User Endpoints

| Method | Endpoint | Description |
|---|---|---|
| GET | `/registerUser` | Registration form |
| POST | `/registerNewUser` | Create user |
| GET | `/userDashboard` | User dashboard |

---

## Station Endpoints

| Method | Endpoint | Description |
|---|---|---|
| GET | `/stationDashboard` | Station dashboard |
| POST | `/updateFuelInfo` | Update inventory |
| POST | `/assignBooking` | Assign delivery person |

---

# Screenshots

| Screen | Path |
|---|---|
| Landing Page | <img width="1899" height="868" alt="image" src="https://github.com/user-attachments/assets/95ac9c36-aae3-4c1a-8d27-1cfb917d4f8b" /> |
| User Dashboard | <img width="1898" height="870" alt="image" src="https://github.com/user-attachments/assets/c8a14f47-3866-4154-9ca9-874222f7eb4b" /> |
| Station Dashboard | <img width="1899" height="869" alt="image" src="https://github.com/user-attachments/assets/53aef71f-11f8-4918-b3b6-02a804ee2103" /> |
| Admin Dashboard | <img width="1900" height="867" alt="image" src="https://github.com/user-attachments/assets/462f6c84-1252-480a-b942-2ca8e3ee5771" /> |

---

# Performance Considerations

## Implemented

- Hibernate first-level caching
- Client-side DataTables pagination
- Static resource serving through Tomcat

---

## Known Bottlenecks

| Issue | Impact |
|---|---|
| No connection pooling | Poor concurrency performance |
| Full table loads | High memory usage |
| Client-side pagination only | Poor scalability |

---

# Security Considerations

## Existing Security Features

- Session-based authentication
- Client-side validation
- Role-isolated dashboards

---

# Tradeoffs & Limitations

| Decision | Tradeoff |
|---|---|
| Spring MVC XML config | Verbose but educational |
| JSP rendering | Faster prototyping, weaker separation |
| No service layer | Simpler architecture, reduced testability |
| Session-based auth | Easier implementation, weak scalability |
| HibernateTemplate | Educational but outdated |

---

# Challenges Faced

- Multi-role session isolation
- Manual Hibernate configuration
- Booking state machine logic
- Dashboard data aggregation
- XML-based Spring configuration

---

# What I Learned

- Spring IoC fundamentals
- Hibernate session lifecycle
- Relational schema modeling
- MVC separation principles
- Session authentication patterns
- Why Spring Boot abstractions matter

---

# License

Distributed under the MIT License.

See `LICENSE` for more information.

---

# Contact

**Heramb Chaudhari**

[![GitHub](https://img.shields.io/badge/GitHub-Heramb1221-black?style=for-the-badge&logo=github)](https://github.com/Heramb1221)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Heramb%20Chaudhari-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/heramb-chaudhari)

[![Email](https://img.shields.io/badge/Email-hchaudhari1221%40gmail.com-red?style=for-the-badge&logo=gmail)](mailto:hchaudhari1221@gmail.com)

---

> Built as a deep exploration of Spring MVC, Hibernate ORM, and traditional Java web application architecture.
