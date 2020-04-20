# Overtime App

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models
- Post -> date:date relational:text
- User -> Devise
- AdminUser -> STI

## Features
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- Administrate admin dashbord
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

## UI
- Bootstrap -> formatting

## How to launch
- bundle
- rails db:migrate
- rails db:setup
- rails db:seed
- yarn add bootstrap jquery popper.js
- add `import "bootstrap";` in application.js and then `@import "bootstrap";` in application.scss