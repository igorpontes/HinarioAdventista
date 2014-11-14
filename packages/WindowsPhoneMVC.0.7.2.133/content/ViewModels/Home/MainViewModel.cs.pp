using System;
using System.Windows.Input;
using $rootnamespace$.Controllers;
using WindowsPhoneMVC;

namespace $rootnamespace$.ViewModels.Home
{
    public class MainViewModel : ViewModelBase
    {
        private string name;

        public MainViewModel()
        {
            ShowAboutPageCommand = Controller<HomeController>().NavigationCommand(c => c.About());

            Transient(() => Name);
        }

        public string Name
        {
            get { return name; }
            set
            {
                name = value;
                OnPropertyChanged(() => Name);
            }
        }

        public ICommand ShowAboutPageCommand { get; set; }
    }
}