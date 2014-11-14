using System.Windows.Input;
using WindowsPhoneEssentials.Commands;
using WindowsPhoneEssentials.Diagnostics;
using WindowsPhoneMVC;

namespace $rootnamespace$.ViewModels.Home
{
    public class AboutViewModel : ViewModelBase
    {
        public AboutViewModel(string applicationName, string author, string website, string feedbackEmail)
        {
            ApplicationName = applicationName;
            Author = author;
            Website = website;
            FeedbackEmail = feedbackEmail;
            ViewWebsiteCommand = new DelegateCommand(ViewWebsite);
            SendFeedbackCommand = new DelegateCommand(SendFeedback);
        }

        private void SendFeedback()
        {
            TaskManager.ComposeEmail(
            to: FeedbackEmail,
            subject: string.Format("Feedback for {0}", ApplicationName));
        }

        private void ViewWebsite()
        {
            TaskManager.ShowWebsiteInApp(Website);
        }

        public string ApplicationName { get; private set; }

        public string Author { get; private set; }

        public string Website { get; private set; }

        public ICommand ViewWebsiteCommand { get; private set; }

        public string Version
        {
            get { return Information.GetAppAttribute("Version"); }
        }

        public string FeedbackEmail { get; private set; }

        public ICommand SendFeedbackCommand { get; private set; }
    }
}