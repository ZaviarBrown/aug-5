# `.env` file default setup

## Create your `.env` in the root of your project

## `npm i dotenv dotenv-cli`

## In your `package.json` add scripts to run with `dotenv`

```json
"scripts": {
  "start": "dotenv nodemon app.js",
  "dev": "dotenv nodemon app.js",
  "prod": "dotenv node app.js",
  "sis": "dotenv -e .env.sister nodemon app.js"
},
```
