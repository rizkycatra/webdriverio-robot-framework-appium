import  os
from pathlib import Path
from dotenv import load_dotenv
load_dotenv()

#Configuration to start session
CURRENT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = CURRENT_DIR.parent.parent 
APP_PATH = os.path.join(PROJECT_ROOT, "app", "android.wdio.native.app.v2.0.0.apk")

REMOTE_URL= os.getenv("REMOTE_URL")
PLATFORM_NAME= 'Android'
DEVICE_NAME= os.getenv("DEVICE_NAME")
APP_PACKAGE= 'com.wdiodemoapp'
APP_ACTIVITY= '.MainActivity'
AUTOMATION_NAME= 'UiAutomator2'
