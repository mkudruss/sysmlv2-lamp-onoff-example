package ExampleView {
    doc
    /* Views for the minimal lamp example.
     *
     * These views are intended to probe current Sensemetry diagram-generation
     * behavior rather than to force polished textbook diagrams.
     *
     * The view set follows the implementation direction discussed in the forum
     * thread on offline diagram generation, where the main controllable levers
     * are expose scope, filter usage, rendering choice, and configurable export
     * attributes.
     *
     * The configurable attributes used here are depth, render, fileType, and
     * fileName. Sequence-style and state-style diagrams are currently inferred
     * from exposed element structure rather than selected through fully
     * separate specialized visualizer modes.
     */

    private import Views::asTreeDiagram;

    view lampContextNestedView {
        doc
        /* Context view rendered as nested.
         *
         * This emphasizes containment and owned parts within the lampSystem
         * usage.
         */
        expose ExampleModel::lampSystem;
        attribute depth = -1;
        attribute fileType = "PNG";
        attribute fileName = "lamp-system-context-nested";
    }

    view lampContextTreeView {
        doc
        /* Context view rendered as tree.
         *
         * This provides the same exposed content as lampContextNestedView, but
         * rendered as a tree to make the hierarchy easier to compare.
         */
        expose ExampleModel::lampSystem;
        render asTreeDiagram;
        attribute depth = -1;
        attribute fileType = "PNG";
        attribute fileName = "lamp-system-context-tree";
    }

    view operateLampUseCaseView {
        doc
        /* Baseline top-level use case view.
         *
         * Intended result:
         * - 'operate lamp' is the visible root use case
         * - User is visible as actor
         * - 'turn lamp on' and 'turn lamp off' are visible as child use cases
         *
         * Tree rendering is used here for determinism.
         *
         * Why this is modeled this way:
         * - the root use case is exposed
         * - its direct children are also exposed
         * - tree rendering is used to force deterministic layout
         * - depth = 1 reduces noise while keeping root-to-child relations visible
         * - filter not @SysML::Documentation removes the documentation node,
         *   but not the documentation compartment
         */
        expose ExampleModel::'operate lamp';
        expose ExampleModel::'operate lamp'::*;
        render asTreeDiagram;
        filter not (@ SysML::Documentation);
        attribute depth = 1;
        attribute fileType = "PNG";
        attribute fileName = "lamp-use-case";
    }

    view turnLampOnSequenceView {
        doc
        /* Baseline interaction view.
         *
         * Intended result:
         * - actor User is visible
         * - subject Lamp is visible
         * - the two messages appear in temporal order
         *
         * This view probes current sequence-style rendering based on exposed
         * occurrence structure.
         * It relies on current auto-detection of sequence-style rendering from
         * an exposed occurrence def containing parts and messages.
         * No separate SequenceView is used because current forum guidance
         * indicates that this has no practical effect in the present visualizer.
         */
        expose ExampleModel::TurnLampOnSeq;
        attribute depth = -1;
        attribute fileType = "PNG";
        attribute fileName = "lamp-turn-on-sequence";
    }

    view turnLampOffSequenceView {
        doc
        /* Baseline interaction view for turning the lamp off.
         *
         * Intended result:
         * - actor User is visible
         * - subject Lamp is visible
         * - the two messages appear in temporal order
         *
         * This view probes current sequence-style rendering based on exposed
         * occurrence structure for the turn-off case.
         */
        expose ExampleModel::TurnLampOffSeq;
        attribute depth = -1;
        attribute fileType = "PNG";
        attribute fileName = "lamp-turn-off-sequence";
    }

    view lampStatesView {
        doc
        /* Baseline state view.
         *
         * Intended result:
         * - states off and on are visible
         * - transitions triggered by TurnOn and TurnOff are visible
         *
         * This view probes how close current rendering gets to a recognizable
         * state diagram and how much generic state/action structure remains.
         *
         * The state root and its direct children are exposed, and depth = 1 is
         * used to reduce inherited stdlib and action clutter.
         * Current limitations remain: the entry marker may render incorrectly,
         * and transition naming/detail may be incomplete.
         */
        expose ExampleModel::lampStates;
        expose ExampleModel::lampStates::*;
        attribute depth = 1;
        attribute fileType = "PNG";
        attribute fileName = "lamp-state-transition";
    }
}
