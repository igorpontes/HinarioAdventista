<phone:PhoneApplicationPage x:Class="$rootnamespace$.Views.Home.AboutPage"
                            xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
                            xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
                            xmlns:phone="clr-namespace:Microsoft.Phone.Controls;assembly=Microsoft.Phone"
                            xmlns:shell="clr-namespace:Microsoft.Phone.Shell;assembly=Microsoft.Phone"
                            xmlns:controls="clr-namespace:Microsoft.Phone.Controls;assembly=Microsoft.Phone.Controls"
                            xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
                            xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
                            xmlns:Home="clr-namespace:$rootnamespace$.ViewModels.Home"
                            xmlns:Commands="clr-namespace:WindowsPhoneMVC.Commands;assembly=WindowsPhoneMVC"
                            xmlns:Converters="clr-namespace:$rootnamespace$.Converters"
                            d:DataContext="{d:DesignInstance Home:AboutViewModel}"
                            FontFamily="{StaticResource PhoneFontFamilyNormal}"
                            FontSize="{StaticResource PhoneFontSizeNormal}"
                            Foreground="{StaticResource PhoneForegroundBrush}"
                            SupportedOrientations="Portrait"
                            Orientation="Portrait"
                            shell:SystemTray.IsVisible="True"
                            mc:Ignorable="d"
                            d:DesignWidth="480"
                            d:DesignHeight="768">
    <phone:PhoneApplicationPage.Resources>
        <Converters:StringFormatConverter x:Key="StringFormatConverter" />
    </phone:PhoneApplicationPage.Resources>
    <Grid x:Name="LayoutRoot">
        <controls:Pivot Title="{Binding ApplicationName}">
            <controls:PivotItem Header="about">
                <StackPanel>
                    <TextBlock Text="{Binding ApplicationName}"
                               Foreground="{StaticResource PhoneAccentBrush}"
                               FontSize="{StaticResource PhoneFontSizeLarge}" />
                    <TextBlock Text="{Binding Author, ConverterParameter='By {0}', Converter={StaticResource StringFormatConverter}}"
                               FontSize="{StaticResource PhoneFontSizeMediumLarge}" />
                    <HyperlinkButton Commands:Click.Command="{Binding ViewWebsiteCommand}"
                                     Foreground="{StaticResource PhoneAccentBrush}"
                                     Content="{Binding Website}"
                                     HorizontalAlignment="Left"
                                     Padding="0"/>

                    <TextBlock Text="{Binding Version, ConverterParameter='Version: {0}', Converter={StaticResource StringFormatConverter}}"
                               Margin="0, 15, 0, 0" />
                    <HyperlinkButton Commands:Click.Command="{Binding SendFeedbackCommand}"
                                     Foreground="{StaticResource PhoneAccentBrush}"
                                     Content="{Binding FeedbackEmail, Converter={StaticResource StringFormatConverter}}"
                                     HorizontalAlignment="Left"
                                     Padding="0" />
                </StackPanel>
            </controls:PivotItem>

            <controls:PivotItem Header="legal">
                <Grid />
            </controls:PivotItem>

            <controls:PivotItem Header="what's new?">
                <Grid />
            </controls:PivotItem>
        </controls:Pivot>
    </Grid>

    <!--Sample code showing usage of ApplicationBar-->
    <!--<phone:PhoneApplicationPage.ApplicationBar>
        <shell:ApplicationBar IsVisible="True" IsMenuEnabled="True">
            <shell:ApplicationBarIconButton x:Name="appbar_button1" IconUri="/Images/appbar_button1.png" Text="Button 1"/>
            <shell:ApplicationBarIconButton x:Name="appbar_button2" IconUri="/Images/appbar_button2.png" Text="Button 2"/>
            <shell:ApplicationBar.MenuItems>
                <shell:ApplicationBarMenuItem x:Name="menuItem1" Text="MenuItem 1"/>
                <shell:ApplicationBarMenuItem x:Name="menuItem2" Text="MenuItem 2"/>
            </shell:ApplicationBar.MenuItems>
        </shell:ApplicationBar>
    </phone:PhoneApplicationPage.ApplicationBar>-->

</phone:PhoneApplicationPage>