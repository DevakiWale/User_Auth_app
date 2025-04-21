# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# User Authentication & Profile Management System

A Ruby on Rails project implementing user login, signup, email verification, profile editing, and role-based access (Admin/User).

## ✨ Features

- Devise Authentication
- Email Verification with Token
- Role-Based Access (Admin/User)
- Profile Editing (Name, Phone, Address, Avatar)
- Admin User Management
- Flash Messages
- Bootstrap/Tailwind Styling

## 🛠 Setup Instructions

1. **Clone the Repository:**

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

2. **Install Gems:**
 bundle install

 3. Set Up Database:

  rails db:create
  rails db:migrate

  4.Start the Server:

  rails s