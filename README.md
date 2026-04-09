# Minimal SysML v2 Tooling Example

This repository is a compact SysML v2 reference project for checking what current tooling can parse, format, and render from a small but representative model.

The example intentionally covers four classic diagram targets:

- context / structure
- use case
- sequence-style interaction
- state behavior

The goal is not domain modeling depth.
The goal is to provide a clean, reproducible example that can be used to compare current behavior across tools such as Sensemetry Syside, SysON, and other SysML v2 implementations.

## Repository Layout

```text
.
├── README.md
├── Taskfile.yml
├── model
│   ├── model.sysml
│   └── view.sysml
└── output
    └── views
```

## Prerequisites

The following tools are expected to be available on the machine:

- `syside`
- `task`

When recording comparison results, also record the exact tool versions used.

## Quick Start

```powershell
task check
task format
task views
```

## What the Example Covers

`model/model.sysml` contains one minimal lamp model:

- `LampSystem` as the structural context
- `'operate lamp'` as the top-level use case
- `TurnLampOnSequence` as the interaction-style example
- `lampStates` as the minimal state behavior example

`model/view.sysml` contains the declared views used to render those elements.

## Intended Use

This repository is designed to be:

- a small reproducible testcase
- a comparison harness across SysML v2 tools
- a support artifact for forum posts or bug reports
- a stable baseline for testing current rendering capability
