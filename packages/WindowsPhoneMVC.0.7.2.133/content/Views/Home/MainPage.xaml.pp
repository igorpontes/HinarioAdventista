<phone:PhoneApplicationPage x:Class="$rootnamespace$.Views.Home.MainPage"
                            xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
                            xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
                            xmlns:phone="clr-namespace:Microsoft.Phone.Controls;assembly=Microsoft.Phone"
                            xmlns:shell="clr-namespace:Microsoft.Phone.Shell;assembly=Microsoft.Phone"
                            xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
                            xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
                            xmlns:commands="clr-namespace:WindowsPhoneMVC.Commands;assembly=WindowsPhoneMVC"
                            xmlns:home="clr-namespace:$rootnamespace$.ViewModels.Home"
                            mc:Ignorable="d"
                            d:DesignWidth="480"
                            d:DesignHeight="768"
                            FontFamily="{StaticResource PhoneFontFamilyNormal}"
                            FontSize="{StaticResource PhoneFontSizeNormal}"
                            Foreground="{StaticResource PhoneForegroundBrush}"
                            SupportedOrientations="Portrait"
                            Orientation="Portrait"
                            shell:SystemTray.IsVisible="True"
                            d:DataContext="{d:DesignInstance home:MainViewModel}">
    <Grid x:Name="LayoutRoot">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto" />
            <RowDefinition Height="*" />
        </Grid.RowDefinitions>

        <StackPanel x:Name="TitlePanel"
                    Grid.Row="0"
                    Margin="12,17,0,28">
            <TextBlock Text="MY APPLICATION"
                       Style="{StaticResource PhoneTextNormalStyle}" />
            <TextBlock Text="page name"
                       Margin="9,-7,0,0"
                       Style="{StaticResource PhoneTextTitle1Style}" />
        </StackPanel>

        <StackPanel x:Name="ContentPanel"
              Grid.Row="1"
              Margin="12,0,12,0">
            <!--To get started you can delete this view, then recreate MainPage or MainView in the same folder and everything will keep working-->
            
            <!--Two ways to navigate currently, use commands for in view actions, or complex navigation-->
            <TextBlock Text="Showing two different ways to navigate" />
            <Button commands:Click.Command="{Binding ShowAboutPageCommand}"
                    Content="About" />
            <Button commands:Navigate.To="Home.About"
                    Content="About" />
        </StackPanel>
    </Grid>

    <!--Sample code showing usage of ApplicationBar, put the Command to bind to in [] after the button text-->
    <!--<phone:PhoneApplicationPage.ApplicationBar>
        <shell:ApplicationBar IsVisible="True"
                              IsMenuEnabled="True">
            <shell:ApplicationBarIconButton IconUri="/Images/appbar_button1.png"
                                            Text="Button 1[SomeCommand]" />
        </shell:ApplicationBar>
    </phone:PhoneApplicationPage.ApplicationBar>-->

</phone:PhoneApplicationPage>