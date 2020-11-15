SPAWN_RATE = 2.5
TIME_SPAWN_UP = 40
SPAWN_RATE_2 = 1.5
MAX_Y = 1275
SCREEN_WIDTH = 720
SCREEN_HEIGHT = 850

MIN_X = 200
MAX_X = 600

WAVE_SPD = 30
OBJECTS_SPD=100

INITIAL_TIME_LEFT=5
ACTUAL_MENU= "start"


playerCrash=love.audio.newSource("SoundEffects/carCrash.wav","stream")
GasGasGas=love.audio.newSource("SoundEffects/Manuel - Gas Gas Gas.mp3","static")
 RunningInThe90=love.audio.newSource("SoundEffects/Running in the 90's.mp3","static")
 DejaVu=love.audio.newSource("SoundEffects/Initial D - Deja Vu.mp3","static")
 GasGasGas:setVolume(0.2)
 RunningInThe90:setVolume(0.2)
 DejaVu:setVolume(0.2)