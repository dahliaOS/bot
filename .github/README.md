<p align="center">
  <img width="30%" src="https://raw.githubusercontent.com/dahliaOS/brand/master/dahliaOS/svg/logotypewhitetext.svg#gh-dark-mode-only"
  
</p>
  
<p align="center">
  <img width="30%" src="https://github.com/dahliaOS/brand/blob/master/dahliaOS/svg/logotypeblacktext.svg#gh-light-mode-only"
  
</p>
<p align="center">
<a href="https://dahliaos.io">Website</a> ●
<a href="https://dahliaos.io/discord">Discord</a> ●
<a href="https://dahliaos.io/download">Releases</a> ●
<a href="https://dahliaos.io/donate">Donate</a> ●
<a href="https://docs.dahliaos.io">Documentation</a>

# dahliaOS Discord bot
![Discord](https://img.shields.io/discord/576141822145986590?color=bright-green)
![License](https://img.shields.io/github/license/dahliaos/bot?color=bright-green)

 - **Discord bot** for the dahliaOS server
 - **Written** in Dart using the [nyxx lib](https://github.com/l7ssha/nyxx)
 
 ## Running the bot

 1. Make sure you have [Dart SDK](https://dart.dev/get-dart) installed
 1. Clone the repo
     ```
     git clone https://github.com/dahliaOS/bot.git
     ```
 1. Create a bot and obtain the token, read this [guide](https://github.com/reactiflux/discord-irc/wiki/Creating-a-discord-bot-&-getting-a-token)
 1. Create a GitHub Personal Access Token, read this [guide](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)
    * This is optional and it's used for the GitHub command, if you don't want to insert your GitHub PAT and username, just leave it out, the only difference is that your API calls will be limited to 60 per hour.
 1. Find your GitHub username
    * Open your GitHub profile
    * The link in your browser's address bar should be: https://github.com/YOUR_USERNAME_HERE
 1. Insert your GitHub PAT, GitHub username and the bot token
    1. Create a .env file in the root folder
    2. Fill it in as shown below:
     ```
    TOKEN='your bot token goes here'
    GITHUB_TOKEN='your github token goes here'
    GITHUB_USERNAME='your github username goes here'
     ```
 1. CD into the dir
     ```
     cd bot
     ```
 1. Run
     ```
     dart run bin/main.dart
     ```

## Contribute

If you're wondering how to contribute to the project, please refer to [CONTRIBUTING.md](../CONTRIBUTING.md)

## License

<p align="left">
  <img width="40%" src="https://raw.githubusercontent.com/dahliaOS/brand/master/dahliaOS/svg/logotypeblacktext.svg#gh-light-mode-only"
<p>
<p align="left">
  <img width="40%" src="https://raw.githubusercontent.com/dahliaOS/brand/master/dahliaOS/svg/logotypewhitetext.svg#gh-dark-mode-only"
<p>

Copyright @ 2019-2022 - The dahliaOS Authors - contact@dahliaos.io

This project is licensed under the [Apache 2.0 license](/LICENSE)
