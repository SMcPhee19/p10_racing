<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/SMcPhee19">
    <img src="https://user-images.githubusercontent.com/120869196/257269049-4c611ea3-9ca2-425a-8e6f-bf37bb3a48c8.png" alt="Logo" >
  </a>

<!-- <h3 align="center">Game Night</h3> -->

  <p align="center">
    Welcome to the repository for P10 Racing <br /> 
    <br />
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#db-design">DB Design</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#technical-solutions">Technical Solutions</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

P10 Racing is a Formula 1 fan game where users compete to collect the most points over the course of a season by attempting to guess what driver finishes in 10th place and who is the first driver to retire for every race on the Formula 1 calendar.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With:
          
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/ruby/ruby-plain.svg" alt="Ruby Logo" width="50" height="50" /> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/rails/rails-plain.svg" alt="Rails Logo" width="50" height="50" /> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/rspec/rspec-original.svg" alt="RSpec Logo" width="50" height="50" /> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postgresql/postgresql-plain.svg" alt="Postgres Logo" width="50" height="50" />  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/sass/sass-original.svg" alt="Sass Logo" width="50" height="50" />          

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

To demo P10 Racing on your local machine, follow these steps: 

### Back End Repository

1. Clone this repo `git@github.com:SMcPhee19/p10_racing.git`
2. Navigate to the local repository: `cd p10_racing`
3. Run: `bundle install`
4. Create your own seeds with your players and season (as well as `UserPicks` if you are starting mid-season)
5. Run: `rails db:{drop,create,migrate,seed}`
6. Run: `rails s` to start the Rails server

### Prerequisites
- Ruby Version 3.1.4
- Rails Version 7.0.5

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Testing -->
## Testing
 
`bundle exec rspec` will run the entire test suite. *All tests are passing at the time of writing. At 100% coverage*

Happy paths, sad paths, and edge cases when needed. Error responses were added where applicable. 


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DB Design -->
## DB Design
 
<img src="https://private-user-images.githubusercontent.com/120869196/302496648-fc89ca51-c643-4aa3-a514-c901716f886b.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcxOTMzNTQsIm5iZiI6MTcwNzE5MzA1NCwicGF0aCI6Ii8xMjA4NjkxOTYvMzAyNDk2NjQ4LWZjODljYTUxLWM2NDMtNGFhMy1hNTE0LWM5MDE3MTZmODg2Yi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjA2JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwNlQwNDE3MzRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0wYzRlNDdlNjU2ODVjMjNiN2NkMTc0Njg5NWFkZDhlYjI0NDhlMzc0YmM5ZTBhNWQxNmY2OGY0ODQwMmFmNzQxJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.YQ63cym8ZbkLkt4ATRx4y9VFlLfeEZDlCBS4Op3yWOk" alt="Schema" width="100%">
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Features

1. **Race Predictions:**
   - Users can predict the 10th place finisher and the first driver not to finish for each race on the Formula 1 calendar.

2. **User Authentication:**
   - Secure user authentication system allowing users to log in, ensuring that actions are associated with specific users.

3. **Role-Based Access:**
   - Different user roles including:
     - **Regular Users:** Can make race predictions for themselves.
     - **Admins:** Have elevated privileges for administrative tasks.
     - **Guest Users:** Can explore the app in showcase mode without initiating creative or destructive actions.

4. **Real-Time Information:**
   - Utilizes API calls to provide real-time data, including:
     - Current driver and constructors standings.
     - Next race details (dates, start times).
     - Next race practice sessions details (dates, start times).
     - Previous race podium results.

5. **Points Tracking:**
   - A table that ranks the drivers by how many points they have earned the users when the user picks them.
   - A table that ranks the users based on points earned

6. **Season Picks Overview:**
   - Comprehensive table displaying all the picks made by users for the entire Formula 1 season.
   - Columns can be sorted to provide various perspectives on the data.
     
7. **Caching for Performance and API Rate Limit Mitigation:**
   - **Performance Boost:**
     - Utilizes caching mechanisms to store frequently requested data locally, reducing response times and enhancing overall application performance.
   - **Rate Limit Mitigation:**
     - Helps prevent hitting external API rate limits by serving cached data when available, minimizing the number of API calls made.
     - Implements cache expiration and refreshing strategies to ensure data accuracy and freshness.
    
<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Technical Solutions -->
## Technical Solutions
1. **Architecture:**
   - This is a monolithic application that makes multiple external API calls.

2. **Technologies Used:**
   - Front-end: Ruby on Rails with Sass
   - Back-end: Ruby on Rails
   - Database: PostgreSQL

3. **Key Design Decisions:**
   - Opted for using hashes and salts to encrypt user passwords instead of using a gem like `bcrypt`.
   - Decided in the project's infancy that this would be a monolithic application, as it's intended for personal use. In the future, a sizeable change will have to be made so this application can easily scale.

4. **Dependencies:**
   - Listed in the `Gemfile`. Notable dependencies include:
     - `faraday` & `net-http` for making API requests
     - `jwt` for authentication
     - `rubocop-rails` for code style and linting

5. **Data Storage:**
   - PostgreSQL is used as the primary database for storing user data and application records.

6. **Authentication and Authorization:**
   - User authentication is handled using JWT tokens, with role-based access control.

7. **APIs and Integrations:**
   - P10 uses the [Ergast Developer API](http://ergast.com/mrd/).

8. **Scalability and Performance:**
   - Implemented caching mechanisms to enhance performance.

9. **Testing Strategy:**
   - Utilizes `rspec-rails`, `capybara`, `shoulda-matchers`, `simplecov`, `timecop`, and `rails-controller-testing` for unit, view, and controller testing. `webmock`, `vcr`, `factorybot`, and `faker` for test data creation and storage.

10. **Deployment:**
    - P10 is deployed on Heroku with future plans to add continuous integration via GitHub Actions.

11. **Styling:**
    - Styled with Sass and TailwindCSS.

    
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

See open issues to look at what we would like to implement in the future.
Some of these include
<ul>
  <li>AI suggestions if a user can't choose who to pick</li>
  <li>Random pick: if a user hasn't created a user pick by x time before the race, a user pick will be created at random for the user</li>
  <li>A toggleable Dark Mode that uses cookies to dynamically change based on user system preferences</li>
  <li>Implement a hamburger menu in the header</li>
  <li>Implement the ability to join leagues</li>
  <li>Forgot password functionality</li>
</ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

### Devs

| [<img alt="Brian Guthrie" width="100" src="https://user-images.githubusercontent.com/120869196/253776434-25807eec-dbb2-49f8-a1fd-3fda117a3685.png"/>](https://www.linkedin.com/in/brian-guthrie-1bba73232/) | [<img alt="Stephen McPhee" width="100" src="https://user-images.githubusercontent.com/120869196/253780562-bdea39b0-2222-448b-bdb3-83f47804a79c.jpg"/>](https://www.linkedin.com/in/smcphee19/) | [<img alt="Adriane Sutherland" width="100" src="https://user-images.githubusercontent.com/120869196/253777040-2a305d4d-c3f4-427d-a2d0-6d345b628f86.jpeg"/>](https://www.linkedin.com/in/adriane-sutherland/)
| ------------ | ---------------- | ---------------- |
| Brian Guthrie | Stephen McPhee | Adriane Sutherland |
| Back-end Developer | Back-end Developer | Front-end Developer |
| [GitHub](https://github.com/Brianisthebest) | [GitHub](https://github.com/SMcPhee19) | [GitHub](https://github.com/asutherland91) |
| [LinkedIn](https://www.linkedin.com/in/brian-guthrie-1bba73232/) | [LinkedIn](https://www.linkedin.com/in/smcphee19/) | [LinkedIn](https://www.linkedin.com/in/adriane-sutherland/) |
| | [Portfolio](https://smcphee-portfolio-282128566f93.herokuapp.com/#page-top) |  |


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/SMcPhee19/p10_racing.svg?style=for-the-badge
[contributors-url]: https://github.com/SMcPhee19/p10_racing/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/SMcPhee19/p10_racing.svg?style=for-the-badge
[forks-url]: https://github.com/SMcPhee19/p10_racing/network/members
[stars-shield]: https://img.shields.io/github/stars/SMcPhee19/p10_racing.svg?style=for-the-badge
[stars-url]: https://github.com/SMcPhee19/p10_racing/stargazers
[issues-shield]: https://img.shields.io/github/issues/SMcPhee19/p10_racing.svg?style=for-the-badge
[issues-url]: https://github.com/SMcPhee19/p10_racing/issues
[license-shield]: https://img.shields.io/github/license/SMcPhee19/p10_racing.svg?style=for-the-badge
[license-url]: https://github.com/SMcPhee19/p10_racing/blob/main/LICENSE.txt
[linkedin]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[stephen-li-url]: https://www.linkedin.com/in/smcphee19/
[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Postgres]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[Github]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[project-gh-url]: https://github.com/SMcPhee19/p10_racing
[stephen-gh-url]: https://github.com/SMcPhee19
