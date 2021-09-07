<p align="center">
<a href="https://dahliaos.io">Website</a> ●
<a href="https://discord.gg/7qVbJHR">Discord</a> ●
<a href="https://github.com/dahliaos/releases/releases">Releases</a> ●
<a href="https://opencollective.com/dahliaos">Donate</a> ●
<a href="https://docs.dahliaos.io">Documentation</a>

# dahliaOS Discord bot
![Discord](https://img.shields.io/discord/576141822145986590?color=bright-green)
![License](https://img.shields.io/github/license/dahliaos/bot?color=bright-green)

 - **Discord bot** for the dahliaOS server
 - **Written** in TypeScript using the [discordx lib](https://yarnpkg.com/package/discordx)
 
 ## Developing and running the bot

 1. Clone the repo
     ```
     git clone https://github.com/dahliaOS/bot
     ```
 1. CD into the dir
     ```
     cd bot
     ```
 1. Create a bot and obtain the token, read this [guide](https://github.com/reactiflux/discord-irc/wiki/Creating-a-discord-bot-&-getting-a-token)
 1. Insert the bot token
    1. Create a .env file in the root folder
    1. Fill it in as shown below:
     ```
    BOT_TOKEN=YOUR_TOKEN_HERE
     ```
 1. Run
     ```
     yarn install
     yarn run build
     yarn run start
     ```

## Contribute

If you're wondering how to contribute to the project, please refer to [CONTRIBUTING.md](../CONTRIBUTING.md)

## License

<p align="left">
  <img width="40%" src="https://github.com/dahliaos/brand/blob/master/Logo%20PNGs/dahliaOS%20logo%20with%20text%20(drop%20shadow).png"
</p>

Copyright @ 2019-2020 The dahliaOS Authors contact@dahliaos.io

This project is licensed under the [Apache 2.0 license](../LICENSE)
