Modify Shell.xaml, add the following xml namespace declaration

    xmlns:Transitions="clr-namespace:WindowsPhoneMVC.Extensions.Transitions;assembly=WindowsPhoneMVC.Extensions.Transitions"


Then replace the Default MvcFrame with the TransitionFrame

    <Transitions:MvcTransitionFrame x:Name="DefaultFrame" />


Now you can use the Silverlight Toolkit Page Transitions. For example (paste into view):

    <toolkit:TransitionService.NavigationInTransition>
        <toolkit:NavigationInTransition>
            <toolkit:NavigationInTransition.Backward>
                <toolkit:TurnstileTransition Mode="BackwardIn" />
            </toolkit:NavigationInTransition.Backward>
            <toolkit:NavigationInTransition.Forward>
                <toolkit:TurnstileTransition Mode="ForwardIn" />
            </toolkit:NavigationInTransition.Forward>
        </toolkit:NavigationInTransition>
    </toolkit:TransitionService.NavigationInTransition>
    <toolkit:TransitionService.NavigationOutTransition>
        <toolkit:NavigationOutTransition>
            <toolkit:NavigationOutTransition.Backward>
                <toolkit:TurnstileTransition Mode="BackwardOut" />
            </toolkit:NavigationOutTransition.Backward>
            <toolkit:NavigationOutTransition.Forward>
                <toolkit:TurnstileTransition Mode="ForwardOut" />
            </toolkit:NavigationOutTransition.Forward>
        </toolkit:NavigationOutTransition>
    </toolkit:TransitionService.NavigationOutTransition>

For more information about the Transitions, see http://blogs.msdn.com/b/wfaught/archive/2010/11/15/transitions.aspx