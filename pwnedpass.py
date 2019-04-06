#!/usr/bin/env python3

from getpass import getpass
from hashlib import sha1

passw = getpass("Password: ")
hashed = sha1(passw.encode("utf-8")).hexdigest().upper()

print(hashed)