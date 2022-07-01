# RTMP Server

## Broadcast

Point OBS to Server `rtmp://example.com:1935/live/` and set a Stream Key of choice (e.g. `nefarius`).

### ffmpeg example

```cmd
.\ffmpeg.exe -re -i "Z:\Path\to\Movie.mp4" -vcodec libx264 -profile:v main -preset:v medium -r 30 -g 60 -keyint_min 60 -sc_threshold 0 -b:v 3000k -maxrate 6000k -bufsize 3000k -sws_flags lanczos+accurate_rnd -acodec aac -b:a 96k -ar 48000 -ac 2 -f flv rtmp://example.com:1935/live/nefarius
```

## Watch

Point your browser to `https://example.com/watch/nefarius` where the last segment or the URL matches your Stream Key (**caution:** case-sensitive).

## Sources

- [hls.js](https://github.com/video-dev/hls.js)
- [Plyr](https://github.com/sampotts/plyr)
