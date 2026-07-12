#!/usr/bin/env python3
"""Discover local Git repositories for the personal project registry."""

from __future__ import annotations

import argparse
import json
import re
import subprocess
from pathlib import Path


MARKERS = [
    "AGENTS.md",
    "CURRENT_STATUS.md",
    "TASKS.md",
    "README.md",
    "package.json",
    "pyproject.toml",
    "Dockerfile",
    "docker-compose.yml",
]


def git(repo: Path, *args: str) -> str:
    result = subprocess.run(
        ["git", "-C", str(repo), *args],
        capture_output=True,
        text=True,
        check=False,
    )
    if result.returncode != 0:
        return ""
    return result.stdout.strip()


def github_owner(remote: str) -> str | None:
    match = re.search(r"github\.com[/:]([^/]+)/[^/]+(?:\.git)?$", remote, re.I)
    return match.group(1) if match else None


def discover(root: Path, max_depth: int, owner: str | None = None) -> list[dict[str, object]]:
    repos: list[Path] = []
    for git_dir in root.rglob(".git"):
        if not (git_dir.is_dir() or git_dir.is_file()):
            continue
        repo = git_dir.parent
        depth = len(repo.relative_to(root).parts)
        if depth <= max_depth:
            repos.append(repo)

    rows = []
    for repo in sorted(set(repos), key=lambda p: str(p)):
        remote = git(repo, "remote", "get-url", "origin")
        if owner and github_owner(remote) != owner:
            continue
        rows.append(
            {
                "name": repo.name,
                "path": str(repo),
                "branch": git(repo, "branch", "--show-current") or "(detached)",
                "remote": remote,
                "markers": [marker for marker in MARKERS if (repo / marker).exists()],
            }
        )
    return rows


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", nargs="?", default=str(Path.home() / "Documents"))
    parser.add_argument("--max-depth", type=int, default=4)
    parser.add_argument("--owner", help="Only include local repositories whose GitHub origin owner matches")
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()

    rows = discover(Path(args.root).expanduser().resolve(), args.max_depth, args.owner)
    if args.json:
        print(json.dumps(rows, ensure_ascii=False, indent=2))
        return 0

    print("| 项目 | 本地路径 | 远端 | 当前分支 | 标记文件 |")
    print("|---|---|---|---|---|")
    for row in rows:
        remote = row["remote"] or "未配置"
        markers = ", ".join(row["markers"]) if row["markers"] else "无"
        print(
            f"| {row['name']} | `{row['path']}` | `{remote}` | "
            f"`{row['branch']}` | {markers} |"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
