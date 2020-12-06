from picamera import PiCamera
from time import sleep

camera = PiCamera()

camera.start_recording('/home/pi/hls/video.h264')
sleep(5)
camera.stop_recording()
