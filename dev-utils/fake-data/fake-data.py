#!/usr/bin/env python3
"""fake-data — generate fake data."""
import sys, random, string

FIRST = ["Alex","Sam","Jordan","Taylor","Morgan","Riley","Casey","Jamie","Avery","Quinn"]
LAST  = ["Smith","Johnson","Lee","Patel","Garcia","Kim","Brown","Davis","Lopez","Wong"]
DOMAINS = ["example.com","test.org","fake.io","mail.dev"]

def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 10
    for _ in range(n):
        first = random.choice(FIRST); last = random.choice(LAST)
        email = f"{first.lower()}.{last.lower()}@{random.choice(DOMAINS)}"
        ip = ".".join(str(random.randint(1,254)) for _ in range(4))
        uid = "".join(random.choices(string.ascii_lowercase + string.digits, k=8))
        print(f"{first} {last}\t{email}\t{ip}\t{uid}")

if __name__ == "__main__":
    main()
