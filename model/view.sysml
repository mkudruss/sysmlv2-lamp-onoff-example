package ExampleView {
    doc
    /* Views for the minimal lamp example.
     *
     * Each view is documented with the intended rendering expectation.
     * Tool behavior can therefore be assessed consistently and compared across tools.
     */

    private import Views::asTreeDiagram;

    view lampContextView {
        doc
        /* Expected result:
         * A structural context view rooted at lampSystem.
         * It shows user, button, and lamp as its contained parts.
         *
         * This view is used to check basic structural decomposition rendering.
         */
        expose ExampleModel::lampSystem;
    }

    view operateLampUseCaseView {
        doc
        /* Expected result:
         * A use case view centered on 'operate lamp'.
         * User is shown as an actor.
         * The child use cases 'turn lamp on' and 'turn lamp off' are visible beneath it.
         *
         * Tree rendering is used here to make the view deterministic.
         */
        expose ExampleModel::'operate lamp';
        render asTreeDiagram;
    }

    view turnLampOnUseCaseView {
        doc
        /* Expected result:
         * A focused use case view for the child use case 'turn lamp on'.
         *
         * This view is useful for checking how tools render a nested use case.
         * The child use case is exposed directly rather than through the parent use case.
         */
        expose ExampleModel::'operate lamp'::'turn lamp on';
        render asTreeDiagram;
    }

    view turnLampOffUseCaseView {
        doc
        /* Expected result:
         * A focused use case view for the child use case 'turn lamp off'.
         *
         * This view mirrors turnLampOnUseCaseView.
         * The two child use cases can therefore be compared consistently.
         */
        expose ExampleModel::'operate lamp'::'turn lamp off';
        render asTreeDiagram;
    }

    view turnLampOnSequenceView {
        doc
        /* Expected result:
         * A sequence-style interaction view showing the actor User.
         * It shows the subject Lamp.
         * It shows the two messages in temporal order.
         *
         * If a tool does not currently support sequence rendering, this view still serves as a valid parsing and exposure test.
         * It still exercises event occurrences and messages.
         */
        expose ExampleModel::TurnLampOnSequence;
    }

    view lampStatesView {
        doc
        /* Expected result:
         * A state-oriented rendering with the states off and on.
         * It shows the transitions triggered by TurnOn and TurnOff.
         *
         * This view is used to check whether tools provide a recognizable state-diagram rendering.
         * It also checks whether they only provide a generic model view.
         */
        expose ExampleModel::lampStates;
    }
}
