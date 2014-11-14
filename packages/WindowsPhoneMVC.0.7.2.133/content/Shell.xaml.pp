<Controls:PhoneApplicationPage x:Class="$rootnamespace$.Shell"
                               xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
                               xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
                               xmlns:shell="clr-namespace:Microsoft.Phone.Shell;assembly=Microsoft.Phone"
                               xmlns:Controls="clr-namespace:Microsoft.Phone.Controls;assembly=Microsoft.Phone"
                               FontFamily="{StaticResource PhoneFontFamilyNormal}"
                               FontSize="{StaticResource PhoneFontSizeNormal}"
                               Foreground="{StaticResource PhoneForegroundBrush}"
                               shell:SystemTray.IsVisible="True"
                               SupportedOrientations="Portrait"
                               Orientation="Portrait"
                               mc:Ignorable="d"
                               xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
                               xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
                               xmlns:Phone="clr-namespace:WindowsPhoneMVC.Phone;assembly=WindowsPhoneMVC"
                               d:DesignHeight="768"
                               d:DesignWidth="480">

    <Phone:MvcFrame x:Name="DefaultFrame" />

</Controls:PhoneApplicationPage>
