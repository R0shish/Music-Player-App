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

- #### POST /api/auth/register

  Register a new user.

  ##### Body

  | Name     | Type   | Description |
  | -------- | ------ | ----------- |
  | name     | string | Name        |
  | email    | string | Email       |
  | password | string | Password    |

- #### POST /api/auth/login

  Login a user.

  ##### Body

  | Name     | Type   | Description |
  | -------- | ------ | ----------- |
  | email    | string | Email       |
  | password | string | Password    |
  
- #### POST /api/auth/regenerateToken

  Regenerate access token.

  ##### Body

  | Name          | Type   | Description      |
  | ------------- | ------ | ---------------- |
  | refresh_token | string | Refresh Token    |
  

### 2. User

- #### GET /api/user/getUserData

  Get user data.
  
  ##### Header

  | Name          | Type   | Description         |
  | ------------- | ------ | ------------------- |
  | Authorization | string | Bearer access_token |
  
 ### 3. Suggested

- #### GET /api/suggestion/getSuggestedPlaylist

  Get suggested playlist.
  
 ### 4. Playlist

- #### PUT api/playlist/addSongs

  Add songs to playlist.
  
  ##### Header

  | Name          | Type   | Description         |
  | ------------- | ------ | ------------------- |
  | Authorization | string | Bearer access_token |


  ##### Body

  | Name             | Type   | Description      |
  | ---------------- | ------ | ---------------- |
  | playlist_id      | string | Playlist Name    |
  | songs            | Song   | Songs Data       |
  

- #### DELETE api/playlist/removeSongs

  Delete songs from playlist.
  
  ##### Header

  | Name          | Type   | Description         |
  | ------------- | ------ | ------------------- |
  | Authorization | string | Bearer access_token |

  ##### Body

  | Name             | Type   | Description      |
  | ---------------- | ------ | ---------------- |
  | playlist_id      | string | Playlist Name    |
  | songs            | Song   | Songs Data       |
  

- #### DELETE api/playlist/deletePlaylist

  Delete a playlist.
  
  ##### Header

  | Name          | Type   | Description         |
  | ------------- | ------ | ------------------- |
  | Authorization | string | Bearer access_token |


  ##### Body

  | Name             | Type   | Description      |
  | ---------------- | ------ | ---------------- |
  | playlist_id      | string | Playlist ID      |
 
