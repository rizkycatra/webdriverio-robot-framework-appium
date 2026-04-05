import  os
from dotenv import load_dotenv
load_dotenv()


#Timeout
TIMEOUT='10s'

#Swipe Duration
SWIPE_DURATION='100ms'

#Credentials
DEFAULT_USER= os.getenv("DEFAULT_USER")
DEFAULT_PASS= os.getenv("DEFAULT_PASS")
