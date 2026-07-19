# Flight Booker

This project is a part of The Odin Project Ruby path curriculum to practice ActiveRecord associations, advanced forms(prepopulating using collections, radio buttons and nested forms). 

## Full project outline, its core and extra features, challenges and bugs occured during the testing phase will be explained here:

## About the project:

Users  can:
- select departing airport
- select arriving airport
- pick a date and time
- choose the number of passengers
- select the flight 
- book the fight(using nested forms)

---

## Database Associations

### Airport
- has_many :departing_flights
- has_many :arriving_flights


### Flight
- belongs_to :departure_airport
- belongs_to :arrival_airport
- has_many :bookings

### Booking
- belongs_to :flight
- has_many :passengers

### Passenger
- belongs_to :booking

---

## Major Challenges & Bugs Fixed

### 1. Nested Passenger Records Not Being Saved in the Database

The booking was created but passengers were not saved in the database.

Problem:
- Booking confirmation page kept showing:
  "Number of Passengers: 0"

Cause:
- ```params.expect(...)``` 
- The controller was not permitting nested parameters appropriately

Fix:
- changed to ```params.require(...).permit(...)``` 
- allow nested attributes in the model `accepts_nested_attributes_for :passengers`

Lesson learned:
- Only Strong parameters permit nested attributes in nested forms

---

### 2. Booking Had No Flight Information After Submission

Problem:
- Booking confirm page crashed with `undefined method 'departure_airport' for nil`

Cause:
- The selected flight was not passed to the booking form
- The booking didn't have assigned `flight_id`

Fix:
- Hidden field was added to store the selected flight
- ```<%= f.hidden_field :flight_id, value: @flight.id %>```

Lesson leared:
- Hiddend fields are helpful tools to store information selcetd on previous pages without shoing them directly 

### 3. Understading Nested Forms

Problem:
- I thought every passenger needs to have its own `new` action

Cause:
- Misunderstanding how rails neste forms really work

Fix:
- build a form for each passenger inside the booking controller:
- ``` @passengers_num.times do
  @booking.passengers.build
end ```
- use `fields_for :passengers` to keep the count of passengers selected

Lesson learned:
- Nested forms allow its parent object to create several records in a single form

### 4. Writing my First RSpec Model Tests

Problem:
- First of all, I had difficulties to understand what actually should be tested
- Secondly, I tried to testimplementation details rather than model behavior

Fix:
Added model spec files to:
- test Flight instance methods
- test Flight associations
- test Passenger validations
- test Booking nested passenger attributes

Lesson Learned:
- Good tests check model behavior instead of code implementations
- Testing really helped me to understand how nested attributes are built by rails behind the scenes

---

### Future Improvements

- sending booking confirmation emails
- managing booking details
- seat selection
- flight cacellation

### Run Model Tests
Models tests are written using RSpec and include:
- FLight instance methods
- Flight associations
- Passenger validations
- Booking nested passenger attributes

Run test:
``` bundle exec rspec ```

---

Built by Zarifa