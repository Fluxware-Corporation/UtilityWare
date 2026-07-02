#!/usr/bin/env python3
"""spinner — show a spinner while a command runs."""
import sys, time, itertools, subprocess, threading

def main():
    if len(sys.argv) < 2:
        print("Usage: spinner <command...>", file=sys.stderr); sys.exit(1)
    cmd = sys.argv[1:]
    done = False
    def spin():
        for c in itertools.cycle("⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"):
            if done: break
            sys.stderr.write(f"\r{c} running...")
            sys.stderr.flush()
            time.sleep(0.1)
    t = threading.Thread(target=spin, daemon=True)
    t.start()
    rc = subprocess.call(cmd)
    done = True
    sys.stderr.write("\r")
    sys.exit(rc)

if __name__ == "__main__":
    main()
