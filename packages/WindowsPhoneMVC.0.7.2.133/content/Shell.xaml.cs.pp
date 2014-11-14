using System;
using Microsoft.Phone.Shell;
using WindowsPhoneMVC;

namespace $rootnamespace$
{
    public partial class Shell : IShell
    {
        public Shell()
        {
            InitializeComponent();
        }

        public void SetApplicationBar(IApplicationBar applicationBar)
        {
            ApplicationBar = applicationBar;
        }
    }
}