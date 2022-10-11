## Music Player Backend

Backend for the Music Player app. It is a REST API written with Node.js and Express.js.

## Setup

Make sure you have Node.js and npm installed on your local machine.
```
git clone https://github.com/R0shish/Music-Player-App.git
cd server
npm install
npm run dev
```

## API

### 1. Authentication

- #### GET /api/auth/register

  Register a new user.

  ##### Parameters

  | Name     | Type   | Description |
  | -------- | ------ | ----------- |
  | name     | string | Name        |
  | email    | string | Email       |
  | password | string | Password    |

- #### GET /api/auth/login

  Login a user.

  ##### Parameters

  | Name     | Type   | Description |
  | -------- | ------ | ----------- |
  | email    | string | Email       |
  | password | string | Password    |

### 2. Playlist

- #### GET /api/playlist/getPlaylist

  Returns the playlist as JSON.
