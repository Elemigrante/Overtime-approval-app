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
- Block non admin and guest users
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

## UI
- Bootstrap -> formatting
- Update the styles for forms

## How to launch
- bundle
- yarn install --check-files
- rails db:migrate
- rails db:setup