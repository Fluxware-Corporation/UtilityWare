#!/usr/bin/env python3
"""todo — tiny JSON-backed todo list."""
import json, os, sys, datetime
PATH = os.path.expanduser("~/.todo.json")

def load():
    if os.path.exists(PATH):
        return json.load(open(PATH))
    return []

def save(items):
    json.dump(items, open(PATH, "w"), indent=2)

def main():
    args = sys.argv[1:]
    items = load()
    if not args or args[0] in ("list", "ls"):
        for i, t in enumerate(items, 1):
            mark = "x" if t["done"] else " "
            print(f"{i:3}. [{mark}] {t['title']}")
    elif args[0] == "add":
        title = " ".join(args[1:])
        items.append({"title": title, "done": False, "created": datetime.date.today().isoformat()})
        save(items)
        print(f"added: {title}")
    elif args[0] == "done":
        idx = int(args[1]) - 1
        items[idx]["done"] = True
        save(items)
        print(f"done: {items[idx]['title']}")
    elif args[0] == "rm":
        idx = int(args[1]) - 1
        removed = items.pop(idx)
        save(items)
        print(f"removed: {removed['title']}")
    elif args[0] == "clear":
        items = [t for t in items if not t["done"]]
        save(items)
        print("cleared completed")
    else:
        print("Usage: todo [list|add <text>|done <n>|rm <n>|clear]", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
