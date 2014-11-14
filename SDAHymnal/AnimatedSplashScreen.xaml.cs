using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Windows.Media.Imaging;

namespace SDAHymnal
{
    public partial class AnimatedSplashScreen : UserControl
    {
        public AnimatedSplashScreen()
        {
            InitializeComponent();
         
        }

        private void Start_Animations(Object sender, EventArgs e)
        {
            myStoryboard.Begin();
        }

    }
}
