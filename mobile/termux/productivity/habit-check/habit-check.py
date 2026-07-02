#!/usr/bin/env python3
"""habit-check — daily habit tracker."""
import json, os, sys, datetime
PATH = os.path.expanduser("~/.habits.json")
today = datetime.date.today().isoformat()

def load():
    return json.load(open(PATH)) if os.path.exists(PATH) else {}

def save(d):
    json.dump(d, open(PATH, "w"), indent=2)

def main():
    data = load()
    args = sys.argv[1:]
    if not args or args[0] == "ls":
        for h, days in data.items():
            count = len(days)
            done = "✓" if today in days else " "
            print(f"[{done}] {h:20s} ({count} days)")
    elif args[0] == "add":
        name = " ".join(args[1:])
        data.setdefault(name, [])
        save(data)
        print(f"added habit: {name}")
    elif args[0] == "done":
        name = " ".join(args[1:])
        if name not in data:
            print(f"habit-check: no such habit '{name}'", file=sys.stderr); sys.exit(1)
        if today not in data[name]:
            data[name].append(today)
            save(data)
            print(f"done: {name} (streak: {len(data[name])} days)")
        else:
            print(f"already done today: {name}")
    elif args[0] == "rm":
        name = " ".join(args[1:])
        data.pop(name, None)
        save(data)
        print(f"removed: {name}")
    else:
        print("Usage: habit-check [ls|add <name>|done <name>|rm <name>]", file=sys.stderr); sys.exit(1)

if __name__ == "__main__":
    main()
