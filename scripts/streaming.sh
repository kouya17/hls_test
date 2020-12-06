#! /bin/bash

httpDir=~/public
cd $httpDir

ffmpeg -f v4l2 -thread_queue_size 512 -input_format h264 -video_size 1280x720 \
  -i /dev/video0 \
  -filter_complex scale=1280x720,fps=12 \
  -g 12 \
  -keyint_min 12 \
  -sc_threshold 0 \
  -flags +cgop+global_header \
  -f hls \
  -hls_time 1 -hls_list_size 3 -hls_allow_cache 0 \
  -hls_segment_filename $httpDir/stream/stream_%d.ts \
  -hls_base_url stream/ \
  -hls_flags delete_segments \
  $httpDir/playlist.m3u8

rm $httpDir/stream/stream_*.ts
rm $httpDir/playlist.m3u8