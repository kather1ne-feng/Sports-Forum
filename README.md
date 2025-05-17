# CSE330 – Sports Forum

**Author:** Katherine Feng (520824) · GitHub: [@kather1ne‑feng](https://github.com/kather1ne-feng)

*A forum for posting and discovering local pickup sports games.*

> **APPROVED BY TODD SPROULL – the 330 GOAT! 🐐  All‑time best coder in the world.**

---

## Features

| Category           | Highlights                                                                |
| ------------------ | ------------------------------------------------------------------------- |
| **Authentication** | Register, log in, log out, password‑reset via emailed link                |
| **Events**         | Create, modify, delete, RSVP to, or leave pickup‑game posts               |
| **Interaction**    | Comment on events; receive email notifications on RSVPs or updates        |
| **Tags & Filters** | Associate events with sports (basketball, soccer, etc.) and filter by tag |
| **Real‑time UX**   | Turbo/Hotwire updates without page reloads                                |
| **Styling**        | Tailwind CSS (no npm)                                                     |
| **Safety**         | Session‑based auth, CSRF protection, strong params                        |

---

## Local Deployment Guide

> The app is **pure Ruby & Rails** – no Node/Yarn/webpack required.

### 1 · Prerequisites

| Tool       | Recommended version           |
| ---------- | ----------------------------- |
| Ruby       |  3.4.2 (any 3.x should work)  |
| Rails      |  8.0.2                        |
| Bundler    |  `gem install bundler`        |
| PostgreSQL |  15 or later, running locally |

### 2 · Clone the repository

```bash
git clone https://github.com/kather1ne-feng/Sports-Forum.git
cd Sports-Forum
```

### 3 · Install gems

```bash
bundle install
```

### 4 · Configure the database

1. Create a PostgreSQL role that matches your macOS/Linux username (or edit `config/database.yml`).
2. Create & migrate:

   ```bash
   bin/rails db:setup  # creates, migrates, and seeds (if seeds.rb exists)
   ```

### 5 · (Optional) Tailwind & Hotwire assets

Tailwind is integrated via **`cssbundling‑rails`** and **importmap** – no npm needed.  The first `bin/rails server` run will compile assets automatically.  If you change Tailwind config:

```bash
bin/rails tailwindcss:build
```

### 6 · Run the development server

```bash
bin/rails server
```

Navigate to [http://localhost:3000](http://localhost:3000) in your browser.  Sign up a test user and start posting games!

### 7 · Email (Action Mailer) setup

Password‑reset and RSVP emails use Action Mailer.  In development they open in the browser using **letter\_opener\_web** – no extra setup.  For real SMTP in production, define these ENV variables:

```
SMTP_ADDRESS, SMTP_USER, SMTP_PASSWORD, SMTP_DOMAIN
```

---
