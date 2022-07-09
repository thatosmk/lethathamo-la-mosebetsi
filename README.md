<h1 align="center">
  Lethathamo
</h1>

<p align="center">
  <a href="https://github.com/thatosmk/lethathamo-la-mosebetsi/actions/workflows/ruby.yml">
    <img src="https://github.com/thatosmk/lethathamo-la-mosebetsi/actions/workflows/ruby.yml/badge.svg" alt="Build Status">
  </a>
</p>

This is a task management app that integrates with Trello.

## Getting started

- Clone the repository
- Request the encryption key that is saved in `config/master.key`
- Run the following commands
```sh
bundle
rails db:create db:migrate
./bin/dev
```
## Front-end

### UI/UX

This uses Tailwindcss for frontend styling and Stimulusjs.


## Backend

This project is built with a Ruby on Rails backend. The database architecture of the backend is shown below.

## Questions

### Improvements

- Use of UUIDs over integers for table primary_key values
- Use of `form_objects` pattern to design the forms for capturing data and sending it to Trello
- Integration with [Sentry](https://sentry.io) for error tracking
