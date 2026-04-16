# Minimal SysML v2 Diagram-Generation Baseline

This repository is a small academic example for exploring the current diagram-generation capabilities of SysIDE.

It is the second iteration of the lamp example used in the related blog post.
The first iteration was used to make a point about the current limitations and our initial misunderstanding of how to drive the renderer.
After clarification in the Sensmetry forum, this version was reduced to a cleaner baseline that now produces results much closer to the blog-post target.

The repository focuses on one question:
how far can current SysIDE diagram output be shaped through view construction?

## Scope

The example probes four targets:

- structure
- use case
- state
- sequence-style interaction

The model is intentionally small.
The main experimental levers are in the views, not in domain complexity.

## Quick Start

```powershell
task help
task check
task format
task views-baseline
```

## What This Example Shows

`model/model.sysml` contains one minimal lamp model with focused slices for structure, use case, state, and interaction behavior.

`model/view.sysml` contains the concrete exported views used to probe current rendering behavior.

The structure baseline is represented twice for the same exposed content:

- nested context view
- tree context view

## Knobs to Play With

The main knobs in this repository are:

- `expose`
- `filter`
- `render`
- `depth`
- `fileName`
- `fileType`
- `zoomLevel`

Practical guidance for this baseline:

- use `expose` to control what the renderer can see
- use `filter` to narrow visible content
- use `render` to compare tree versus nested output
- use `depth` carefully, especially for sequence-style views
- set file-related attributes explicitly so exports are reproducible

For the formal definition of these knobs, see the official SysIDE views documentation in [References](#references).

## Current Limitations

This repository documents the limitations discussed in the blog post and observed in current SysIDE output:

- styling freedom is limited by the current rendering stack
- there is no separate polished sequence or state-diagram mode; those outputs are inferred from model shape
- filtering does not hide compartments; for example, filtering documentation removes the node but not the documentation compartment
- static CLI sequence arrows currently render left-to-right regardless of modeled `from` / `to` direction
- sequence-style views are sensitive to `depth`; shallow traversal can collapse message structure
- lifeline order is not currently deterministic or user-controlled
- the state entry marker and some transition details are still imperfect

## Baseline Output Snapshots

<details>
<summary><code>lampContextNestedView</code> -> <code>lamp-system-context-nested.png</code></summary>

![lamp-system-context-nested](static/views/lamp-system-context-nested.png)

</details>

<details>
<summary><code>lampContextTreeView</code> -> <code>lamp-system-context-tree.png</code></summary>

![lamp-system-context-tree](static/views/lamp-system-context-tree.png)

</details>

<details>
<summary><code>operateLampUseCaseView</code> -> <code>lamp-use-case.png</code></summary>

![lamp-use-case](static/views/lamp-use-case.png)

</details>

<details>
<summary><code>lampStatesView</code> -> <code>lamp-state-transition.png</code></summary>

![lamp-state-transition](static/views/lamp-state-transition.png)

</details>

<details>
<summary><code>turnLampOnSequenceView</code> -> <code>lamp-turn-on-sequence.png</code></summary>

![lamp-turn-on-sequence](static/views/lamp-turn-on-sequence.png)

</details>

<details>
<summary><code>turnLampOffSequenceView</code> -> <code>lamp-turn-off-sequence.png</code></summary>

![lamp-turn-off-sequence](static/views/lamp-turn-off-sequence.png)

</details>

## References

### Blog / discussion context

- Related blog post: add link here
- Sensmetry forum thread: Offline diagram generation

### Official documentation

- SysML v2 Views - Configurable attributes  
  <https://docs.sensmetry.com/modeler/sysml-views.html#configurable-attributes>

- SysML v2 Views - Understanding filters  
  <https://docs.sensmetry.com/modeler/sysml-views.html#understanding-filters>

### Standards

- OMG KerML 1.0 - PDF  
  <https://www.omg.org/spec/KerML/1.0/PDF>

- OMG SysML 2.0 Language - PDF  
  <https://www.omg.org/spec/SysML/2.0/Language/PDF>
