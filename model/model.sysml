package ExampleModel {
    doc
    /* Minimal SysML v2 reference model for checking current tool support
     * for structure, use cases, sequence-style interaction, and state behavior.
     *
     * The model is intentionally small and stable.
     * It is designed for parser, formatter, and view-rendering experiments rather than domain depth.
     */

    part def User;
    part def Button;
    part def Lamp;

    part def LampSystem {
        doc
        /* Structural context for the example.
         * The system is decomposed into one user, one button, and one lamp.
         */

        part user : User;
        part button : Button;
        part lamp : Lamp;
    }

    part lampSystem : LampSystem;

    use case 'operate lamp' {
        doc
        /* Top-level use case for the example.
         * This use case is intentionally simple.
         * Actor placement and child use case rendering can therefore be compared across tools.
         */

        subject lamp : Lamp;
        actor user : User;

        use case 'turn lamp on';
        use case 'turn lamp off';
    }

    use case def TurnLampOnSequence {
        doc
        /* Minimal interaction-style example.
         * The user presses the button.
         * The lamp receives the command.
         * The user then observes that the lamp is on.
         *
         * This element is included to test whether a tool only parses event occurrences and messages.
         * It also tests whether a tool can render them as a recognizable sequence-style view.
         */

        subject lamp : Lamp {
            event occurrence commandReceived;
            then
            event occurrence lampTurnedOn;
        }

        actor user : User {
            event occurrence pressesButton;
            then
            event occurrence observesLampOn;
        }

        message from user.pressesButton to lamp.commandReceived;
        then message from lamp.lampTurnedOn to user.observesLampOn;
    }

    action def TurnOn;
    action def TurnOff;

    state def LampStates {
        doc
        /* Minimal state machine definition for the example.
         * The lamp begins in Off.
         * It transitions to On on TurnOn.
         * It transitions back to Off on TurnOff.
         */
    }

    state lampStates : LampStates {
        entry;
        then off;

        state off;
        transition off accept TurnOn then on;

        state on;
        transition on accept TurnOff then off;
    }
}
