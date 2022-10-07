## Music Player Backend

Backend for the Music Player app. It is a REST API written with Node.js and Express.js.

## Setup

1. Install Node.js and npm
2. Install dependencies: `npm install`
3. Start the server: `npm run dev`

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
