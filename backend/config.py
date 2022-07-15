from environs import Env

env = Env()

env.read_env()


ACCESS_TOKEN_EXPIRE_MINUTES = env.int("ACCESS_TOKEN_EXPIRE_MINUTES")
ALGORITHM = env.str("ALGORITHM")

SECRET_KEY = env.str("SECRET_KEY")


DATABASE_URL = env.str("DATABASE_URL")
VK_TOKEN = env.str("VK_TOKEN")