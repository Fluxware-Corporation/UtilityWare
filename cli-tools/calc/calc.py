#!/usr/bin/env python3
"""calc — safe inline calculator."""
import sys
import ast
import operator

OPS = {
    ast.Add: operator.add, ast.Sub: operator.sub, ast.Mult: operator.mul,
    ast.Div: operator.truediv, ast.Pow: operator.pow, ast.Mod: operator.mod,
    ast.USub: operator.neg, ast.UAdd: operator.pos,
    ast.FloorDiv: operator.floordiv,
}

def ev(node):
    if isinstance(node, ast.Expression): return ev(node.body)
    if isinstance(node, ast.Constant): return node.value
    if isinstance(node, ast.BinOp): return OPS[type(node.op)](ev(node.left), ev(node.right))
    if isinstance(node, ast.UnaryOp): return OPS[type(node.op)](ev(node.operand))
    raise ValueError(f"unsupported: {ast.dump(node)}")

def main():
    if len(sys.argv) < 2:
        print("Usage: calc '<expression>'", file=sys.stderr); sys.exit(1)
    expr = " ".join(sys.argv[1:])
    try:
        tree = ast.parse(expr, mode="eval")
        print(ev(tree.body))
    except Exception as e:
        print(f"calc: {e}", file=sys.stderr); sys.exit(2)

if __name__ == "__main__":
    main()
