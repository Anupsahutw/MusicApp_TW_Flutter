# Music Player

This is a music player app developed in Flutter. It uses the iTunes affiliate API and allows to search by artist and displays the search results on the screen. By default, all the songs are fetched from the iTunes affiliate API are displayed on the screen.

    Below details of a song are displayed on Playlist screen :

            Title
            Artist
            Album
            Album Thumbnail

This project is based upon MVVM (Model-View-ViewModel) Architecture pattern. BLOC design pattern is also used for development of this project.

As requested, only Android mobile device is supported. Supported device - Google Pixel 2 API 29 emulator.

    Features covered in this application are as under:

          Integration with iTunes affiliate API
          Retrieve all songs
          Play
          Pause
          When we tap a song, a media player shows up at the bottom of the screen and starts to play the preview for that song.
          Search
          Smooth UI
          The media player shows only when a song is selected and stays on the screen from that point onwards and is reused for any subsequent song played.
          When a song is being played, an indicator (SeekBar) for the same is displayed in the list.
          Current song continues to play even when a new search is performed. Select any song from search result list to play a particular song.

Requirements to build the app - If you are on latest flutter version, you might consider downgrading to Flutter version- v1.0.0+1+hotfix.4, for the application to work. This application supports Flutter version: 1.0.0+1+hotfix.4 because of the dependency on the library - "assets_audio_player - 2.0.13" which is dependent on the Flutter version - v1.0.0+1+hotfix.4. This library is used to display media player on the screen. Android Studio version - 4.1.1 & Gradle version - 4.10.2 was used for the development of the project. Hence, please use mentioned versions respectively, if you face any issues while compiling the project.

How to use and run the code shared? Step 1. Simply do - git clone bundle_name.bundle repo Step 2. cd repo Step 3. flutter run

