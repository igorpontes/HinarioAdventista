<!DOCTYPE html> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
  <title>WindowsPhoneMVC Notes</title> 
  <meta http-equiv="content-type" content="text/html; charset=utf-8" /> 
  <style type="text/css">
  	body {
  		font-family: Segoe UI, Tahoma;
  		font-size: 10pt;
  		max-width: 600px;
  		margin-left: 18px;
  		margin-top: 0px;
  	}
  	h1 {
  		font-family: Trebuchet MS, Segoe UI, Tahoma;
  		font-size: 15pt;
  		font-weight: normal;
  		color: #32A700;
  		margin-top: 14px;
  		margin-bottom: 5px;
  	}
    h2 {
  		font-family: Trebuchet MS, Segoe UI, Tahoma;
  		font-size: 12pt;
  		font-weight: normal;
  		color: #32A700;
  		margin-top: 10px;
  		margin-bottom: 5px;
  	}
    
    h3 {
  		font-family: Trebuchet MS, Segoe UI, Tahoma;
  		font-size: 11pt;
  		font-weight: normal;
  		color: #32A700;
  		margin-top: 8px;
  		margin-bottom: 5px;
  	}
  	p 
  	{
  	    margin-top: 14px;
  	    margin-bottom: 14px;
  	}
  	a, a:visited, a:active, a:hover {
  		color: #0000bb;
  	}
  	kbd {
  		font-family: Consolas, Lucida Console, Courier;
  		font-weight: bold;
  		color: #000099;
  	}
  	.ps {
  	    color: #626464;
  	}
    .comment {
        color: #32A700;
    }
  </style>
</head> 
<body> 
	<h1>Windows Phone MVC</h1>
	<p>
	    We have added to your project all you need to get started with Windows Phone MVC.
	</p>
	<pre>
Controllers
    HomeController.cs     <span class="comment">//This is the Default Controller, you put all your actions in controllers. The default Action is called Main/MainPage</span>
ViewModels
    Home
        MainViewModel.cs  <span class="comment">//You are free to put ViewModels anywhere</span>
Views
    MainPage.xaml         <span class="comment">//By convention, returning Page() from the controller will find a view with the same name</span>
Shell.xaml                <span class="comment">//Windows Phone MVC does not use the inbuild NavigationService, it has it's own</span>
                          <span class="comment">//This means you have full control over the application shell, and in the future, multiple navigation frames</span>
</pre>
	
    <h1>Extensions</h1>
        <h2>WindowsPhoneMVC.Extensions.Transitions</h2>
        Provides a MvcTransitionFrame to enable page transitions. Relies on Silverlight Toolkit

        <h2>WindowsPhoneMVC.Extensions.AutofacIntegration</h2>
        Be up and running using Autofac in Windows Phone MVC by simply installing this extension!


    <h1>Getting Started</h1>
    <ul>
        <li>Edit WMAppManifest.xml</li>
        <li>Make Shell.xaml the default task (&lt;DefaultTask Name ="_default" NavigationPage="Shell.xaml"/&gt;)</li>
        <li>Overwrite your App.xaml and App.xaml.cs with the code below, as you can see it is far simpler than the default</li>
        <li>Add a reference to Microsoft.Phone.Controls</li>
    </ul>
    <p>You should be right to go after that. Check out <a href="http://windowsphonefoundations.net/windowsphonemvc">http://windowsphonefoundations.net/windowsphonemvc</a> for more documentation and how to's.</p>

    <h1>Example App.xaml</h1>
    <pre>
&lt;Application x:Class="$rootnamespace$.App"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:WindowsPhoneMVC="clr-namespace:WindowsPhoneMVC;assembly=WindowsPhoneMVC"
             UnhandledException="ApplicationUnhandledException"&gt;
    
    &lt;Application.ApplicationLifetimeObjects&gt;
        &lt;WindowsPhoneMVC:NavigationApplication Trace="NavigationApplicationOnTrace" /&gt;
    &lt;/Application.ApplicationLifetimeObjects&gt;
&lt;/Application&gt;
    </pre>

    <h1>Example App.xaml.cs</h1>
    <pre>
using System;
using System.Diagnostics;
using System.Windows;
using Microsoft.Phone.Shell;
using WindowsPhoneMVC;

namespace $rootnamespace$
{
    public partial class App
    {
        public App()
        {
            InitializeComponent();

            // Show graphics profiling information while debugging.
            if (Debugger.IsAttached)
            {
                // Display the current frame rate counters.
                Host.Settings.EnableFrameRateCounter = true;

                // Show the areas of the app that are being redrawn in each frame.
                //Application.Current.Host.Settings.EnableRedrawRegions = true;

                // Enable non-production analysis visualization mode, 
                // which shows areas of a page that are handed off to GPU with a colored overlay.
                //Application.Current.Host.Settings.EnableCacheVisualization = true;

                // Disable the application idle detection by setting the UserIdleDetectionMode property of the
                // application's PhoneApplicationService object to Disabled.
                // Caution:- Use this under debug mode only. Application that disable user idle detection will continue to run
                // and consume battery power when the user is not using the phone.
                PhoneApplicationService.Current.UserIdleDetectionMode = IdleDetectionMode.Disabled;
            }
        }

        private void ApplicationUnhandledException(object sender, ApplicationUnhandledExceptionEventArgs e)
        {
            if (Debugger.IsAttached)
                Debugger.Break();
            else
                MessageBox.Show(e.ExceptionObject.Message);
        }

        private void NavigationApplicationOnTrace(object sender, TraceOutputEventArgs e)
        {
            Debug.WriteLine(e.Message);
        }
    }
}
    </pre>
	<p class="ps">
	   PS: This HTML file won't self-destruct. You'll probably want to delete it when done.
	</p>

</body>
</html>