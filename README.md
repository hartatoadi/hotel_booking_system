# Room Booking System API

## Description

This system is an API for managing room bookings, including tables for `Room`, `RatePlan`, `Calendar`, and `Booking`. The API is designed to handle CRUD operations and manage room availability based on bookings.

## Features

- CRUD operations for Room, RatePlan, Calendar, and Booking tables.
- Decreases room availability when a booking is made.
- Restores room availability when a booking is canceled.
- Manages booking details, including name, email, and phone number.

## Database Structure

### Room Table

- `id`: Room ID
- `name`: Room name
- `slug`: Slug for the room name
- `description`: Room description
- `feature`: Room features (bed type, size, occupancy, view)
- `published`: Publication status (boolean)
- `availability`: Total available rooms
- `images`: Room images

### RatePlan Table

- `id`: Rate plan ID
- `room_id`: Foreign key to Room table
- `name`: Rate plan name
- `slug`: Slug for the rate plan
- `detail`: Rate plan details
- `price`: Rate plan price

### Calendar Table

- `id`: Calendar ID
- `room_id`: Foreign key to Room table
- `rateplan_id`: Foreign key to RatePlan table
- `date`: Date
- `availability`: Total rooms available for that date
- `price`: Price for that date

### Booking Table

- `id`: Booking ID
- `room_id`: Foreign key to Room table
- `rateplan_id`: Foreign key to RatePlan table
- `calendar_id`: Foreign key to Calendar table
- `reservation_number`: Reservation number (format: date-now-random(6)-booking ID)
- `reservation_date`: Reservation date
- `check_in`: Check-in date
- `check_out`: Check-out date
- `name`: Guest name
- `email`: Guest email
- `phone_number`: Guest phone number

## API Endpoints

### Room

- `GET /rooms`: Retrieve all rooms
- `POST /rooms`: Add a new room
- `PATCH /rooms/:id`: Update a room
- `DELETE /rooms/:id`: Delete a room

### RatePlan

- `GET /rate_plans`: Retrieve all rate plans
- `POST /rate_plans`: Add a new rate plan
- `PATCH /rate_plans/:id`: Update a rate plan
- `DELETE /rate_plans/:id`: Delete a rate plan

### Calendar

- `GET /calendars`: Retrieve all calendar entries
- `POST /calendars`: Add a new calendar entry
- `PATCH /calendars/:id`: Update a calendar entry
- `DELETE /calendars/:id`: Delete a calendar entry

### Booking

- `GET /bookings`: Retrieve all bookings
- `POST /bookings`: Add a new booking
- `PATCH /bookings/:id`: Update a booking
- `DELETE /bookings/:id`: Delete a booking

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/hartatoadi/hotel_booking_system.git
   cd hotel_booking_system
   ```
2. Install dependencies:
   ```bash
   bundle install
   ```

3. Run migrations to create tables in the database:
   ```bash
   rails db:migrate
   ```

4. Start the server:
   ```bash
   rails server
   ```


## Testing
Use Postman or similar tools to test the API. Be sure to follow the provided endpoint documentation.