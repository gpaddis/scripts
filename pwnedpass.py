#!/usr/bin/env python3
"""
Check for breached passwords against the pwnedpasswords database.
https://haveibeenpwned.com/API/v2#PwnedPasswords
"""

from getpass import getpass
from hashlib import sha1
from requests import get

passw = getpass("Password: ")
hashed = sha1(passw.encode("utf-8")).hexdigest().upper()

lines = get("https://api.pwnedpasswords.com/range/" + hashed[:5]).text.splitlines()
match = [l.split(":")[1] for l in lines if hashed[5:] in l]

if match:
    print("The password appears %s times in the database." % match[0])
else:
    print("No breaches found for your password.")