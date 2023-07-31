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
    <li><a href="#endpoint">Endpoint</a></li>
    <li><a href="#technical-solutions">Technical Solutions</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

P10 Racing is a Formula 1 fan game where users compete to collect the most points over the course of a season by attempting to guess what driver finishes in 10th place and who is the first driver to retire for every race on the Formula 1 calendar.

- GitHub repository: [![Github][Github]][project-gh-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With:

[![Ruby][Ruby]][Ruby-url] [![Rails][Rails]][Rails-url] [![PostgreSQL][Postgres]][Postgres-url] <img src="https://user-images.githubusercontent.com/116964982/238382095-7d4a3eeb-c907-4e1c-b8cf-abf6b8c20c6e.png"/> <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"/>


P10's applicaiton uses these integrations:
* [Ergast Developer API](http://ergast.com/mrd/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

To demo P10 Racing on your local machine, follow these steps: 

### Back End Repository

3. Clone this repo `git@github.com:SMcPhee19/p10_racing.git`
4. Navigate to the local repository: `cd p10_racing`
5. Run: `bundle install`
6. Create your own seeds with your players and season
7. Run: `rails db:{drop,create,migrate,seed}`
10. Run: `rails s` to start the Rails server

### Prerequisites
- Ruby Version 3.1.1
- Rails Version 7.0.5

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Testing -->
## Testing
 
`bundle exec rspec` will run the entire test suite. *All tests are passing at the time of writing. At 100% coverage*

The team tested happy paths, sad paths, and edge cases when needed. Error responses were added where applicable. 


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DB Design -->
## DB Design
 
 <img src="https://user-images.githubusercontent.com/120869196/257363186-b1bf0063-818e-4d41-9171-11a89ab2396f.png" alt="Schema" width="100%">
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Endpoint

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Technical Solutions -->
## Technical Solutions

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

### Devs

| [<img alt="Brian Guthrie" width="100" src="https://user-images.githubusercontent.com/120869196/253776434-25807eec-dbb2-49f8-a1fd-3fda117a3685.png"/>](https://www.linkedin.com/in/brian-guthrie-1bba73232/) | [<img alt="Stephen McPhee" width="100" src="https://user-images.githubusercontent.com/120869196/253780562-bdea39b0-2222-448b-bdb3-83f47804a79c.jpg"/>](https://www.linkedin.com/in/smcphee19/) |
| ------------ | ---------------- | 
| Brian Guthrie | Stephen McPhee |
| Back-end Developer | Back-end Developer |
| [GitHub](https://github.com/Brianisthebest) | [GitHub](https://github.com/SMcPhee19) |
| [LinkedIn](https://www.linkedin.com/in/brian-guthrie-1bba73232/) | [LinkedIn](https://www.linkedin.com/in/smcphee19/) |


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
