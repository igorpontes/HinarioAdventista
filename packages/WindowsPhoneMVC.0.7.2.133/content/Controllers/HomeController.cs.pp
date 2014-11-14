using $rootnamespace$.ViewModels.Home;
using WindowsPhoneEssentials.Diagnostics;
using WindowsPhoneMVC;
using WindowsPhoneMVC.ActionResults;

namespace $rootnamespace$.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Main()
        {
            //Possible ActionResults

            //Page()
            //DoNothing()
            //Dialog()
            //CloseDialog()

            return Page(new MainViewModel());
        }

        public ActionResult About()
        {
            return Page(new AboutViewModel("$rootnamespace$", Information.GetAppAttribute("Author"), "google.com", "example@test.com"));            
        }
    }
}
