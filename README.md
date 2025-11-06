# Moonlit Marvela Hotel Database Project

This project is a relational database designed to manage hotel operations for **Moonlit Marvela Hotel**.  
It supports customer reservations, room management, staff administration, billing, services, and customer reviews.

The system ensures organized data flow and maintains relationships between core hotel entities.

---

## Main Database Features
- Store customer personal information and contact details.
- Manage room availability, pricing, and maintenance status.
- Create and track reservations for customers.
- Generate bills that include room charges and additional services.
- Record staff information, roles, salaries, and working hours.
- Store hotel services and link them to customer bills.
- Allow customers to request services.
- Collect hotel stay ratings and reviews.

---

## Database Structure (Main Tables)
| Table | Description |
|-------|-------------|
| **Customer** | Stores customer names, phone numbers, and email addresses. |
| **Room** | Contains room type, availability status, and price details. |
| **Reservation** | Records check-in/check-out dates linked to a customer. |
| **ReservationRoom** | Connects reservations to one or more rooms. |
| **Bill** | Stores payment details and total charges for each reservation. |
| **Services** | List of extra hotel services (spa, buffet, gym, etc.). |
| **Includes** | Links bills with services used. |
| **Requests** | Tracks services requested directly by customers. |
| **Staff** | Stores employee details, roles, salaries, and work hours. |
| **Review** | Records customer review ratings per reservation. |

---

## Relationship Highlights
- A **customer** can make **multiple reservations**.
- A **reservation** can include **multiple rooms**.
- A **bill** may include **multiple services**.
- Customers may **request additional services**.
- Staff have **fixed roles** and working details stored.

---

## How to Run the Database
```sql
DROP SCHEMA MoonlitMarvela;
CREATE SCHEMA MoonlitMarvela;
USE MoonlitMarvela;

-- Then run table creation + insert statements (included in the .sql file)
