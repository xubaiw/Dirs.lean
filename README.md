# Dirs.lean

Retrieve platform-specific directories in Lean 4, ported from Rust's [`dirs`](https://github.com/dirs-dev/dirs-rs).

Currently, only Linux and MacOS is supported:

| Function name | Value on Linux |  Value on macOS |
| ------------- | -------------- | --------------- |
| `home_dir` | `some $HOME` | `some $HOME` |
| `cache_dir` | `some $XDG_CACHE_HOME <⎮> some $HOME/".cache"` | `some $HOME/"Library"/"Caches"` |
| `config_dir` | `some $XDG_CONFIG_HOME <⎮> some $HOME/".config"` | `some $HOME/"Library"/"Application Support"` |
| `data_dir` | `some $XDG_DATA_HOME <⎮> some $HOME/".local"/"share"` | `some $HOME/"Library"/"Application Support"` |
| `data_local_dir` | `some $XDG_DATA_HOME <⎮> some $HOME/".local"/"share"` | `some $HOME/"Library"/"Application Support"` |
| `executable_dir` | `some $XDG_BIN_HOME <⎮> some $HOME/".local"/"bin"` | `none` |
| `preference_dir` | `some $XDG_CONFIG_HOME <⎮> some $HOME/".config"` |  `some $HOME/"Library"/"Preferences"` |
| `runtime_dir` | `some $XDG_RUNTIME_DIR <⎮> none` | `none` |
| `state_dir` | `some $XDG_STATE_HOME <⎮> some $HOME/".local"/"state"` | `none` |
| `audio_dir` | `some XDG_MUSIC_DIR <⎮> none` | `some $HOME/"Music"` |
| `desktop_dir` | `some XDG_DESKTOP_DIR <⎮> none` | `some $HOME/"Desktop"` |
| `document_dir` | `some XDG_DOCUMENTS_DIR <⎮> none` | `some $HOME/"Documents"` |
| `download_dir` | `some XDG_DOWNLOAD_DIR <⎮> none` | `some $HOME/"Downloads"` |
| `font_dir` | `some $XDG_DATA_HOME/"fonts" <⎮> some $HOME/".local"/"share"/"fonts"` | `some $HOME/"Library"/"Fonts"` |
| `picture_dir` | `some XDG_PICTURES_DIR <⎮> none` | `some $HOME/"Pictures"` |
| `public_dir` | `some XDG_PUBLICSHARE_DIR <⎮> none` | `some $HOME/"Public"` |
| `template_dir` | `some XDG_TEMPLATES_DIR <⎮> none` | `none` |
| `video_dir` | `some XDG_VIDEOS_DIR <⎮> none` | `some $HOME/"Movies"` |
