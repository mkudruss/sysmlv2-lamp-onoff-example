package ExampleModel {
    doc
    /* Minimal SysML v2 example model for evaluating current Sensemetry
     * diagram-generation behavior.
     *
     * The model is intentionally small and stable. It is not a domain model.
     * It is a focused capability probe for structure, use case, interaction,
     * and state rendering.
     *
     * The example follows the current Sensemetry guidance for probing
     * structure, use case, occurrence-based interaction, and state rendering.
     */

    part def User;
    part def Button;
    part def Lamp;

    part def LampSystem {
        doc
        /* Minimal structural context used to test context and containment views.
         *
         * The system is decomposed into one user, one button, and one lamp so
         * that structural rendering remains easy to inspect.
         */

        part user : User;
        part button : Button;
        part lamp : Lamp;
    }

    part lampSystem : LampSystem;

    /* Minimal top-level use case used to test actor, subject, and child
     * use case rendering.
     *
     * The use case is intentionally simple so that rendering differences are
     * easier to attribute to view construction rather than model complexity.
     */
    use case 'operate lamp' {
        subject lamp : Lamp;
        actor user : User;

        use case 'turn lamp on';
        use case 'turn lamp off';
    }

    /* Minimal interaction example used to probe sequence-style diagram
     * generation.
     *
     * The user presses the button, the lamp receives the command, and the
     * user then observes that the lamp is on.
     *
     * This interaction is modeled as an occurrence def, not a use case
     * def, because current sequence-style rendering is inferred from
     * exposed occurrences with parts and messages.
     */
    occurrence def TurnLampOnSeq {
        part lamp : Lamp {
            event occurrence commandReceived;
            then event occurrence lampTurnedOn;
        }

        part user : User {
            event occurrence pressesButton;
            then event occurrence observesLampOn;
        }

        message from user.pressesButton to lamp.commandReceived;
        then message from lamp.lampTurnedOn to user.observesLampOn;
    }

    /* Minimal interaction example used to probe sequence-style diagram
     * generation for turning the lamp off.
     *
     * The user presses the button, the lamp receives the command, and the
     * user then observes that the lamp is off.
     *
     * This interaction is modeled as an occurrence def, not a use case
     * def, because current sequence-style rendering is inferred from
     * exposed occurrences with parts and messages.
     */
    occurrence def TurnLampOffSeq {
        part lamp : Lamp {
            event occurrence commandReceived;
            then event occurrence lampTurnedOff;
        }

        part user : User {
            event occurrence pressesButton;
            then event occurrence observesLampOff;
        }

        message from user.pressesButton to lamp.commandReceived;
        then message from lamp.lampTurnedOff to user.observesLampOff;
    }

    action def TurnOn;
    action def TurnOff;

    /* Minimal state-machine definition used to probe state-oriented
     * rendering.
     *
     * The lamp begins in Off, transitions to On on TurnOn, and transitions
     * back to Off on TurnOff.
     *
     * This state machine is intentionally minimal because current
     * state-oriented rendering is sensitive to expose scope and depth.
     * Known current limitations include generic state/action structure
     * remaining visible and imperfect rendering of the entry indicator.
     */
    state def LampStates;

    state lampStates : LampStates {
        entry;
        then off;

        state off;
        transition off accept TurnOn then on;

        state on;
        transition on accept TurnOff then off;
    }
}
