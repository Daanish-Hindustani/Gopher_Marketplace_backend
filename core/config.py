from enum import Enum

from pydantic import BaseSettings


class EnvironmentType(str, Enum):
    DEVELOPMENT = "development"
    PRODUCTION = "production"
    TEST = "test"


class BaseConfig(BaseSettings):
    class Config:
        case_sensitive = True
        env_file = ".env"  
        env_file_encoding = "utf-8"


class Config(BaseConfig):
    ENVIRONMENT: EnvironmentType 
    DEBUG: bool 

config = Config()