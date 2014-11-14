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
using Microsoft.Phone.Controls;
using SDAHymnal.ViewModels;
using Microsoft.Phone.Tasks;

namespace SDAHymnal
{
    public partial class OpenHymn : PhoneApplicationPage
    {
        public OpenHymn()
        {
            InitializeComponent();
        }

        protected override void OnNavigatedTo(System.Windows.Navigation.NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);
            string parameter = this.NavigationContext.QueryString["parameter"];

            Hymn hymn = null;
            int hymnId = -1;
            if (int.TryParse(parameter, out hymnId))
            {
                IHymnRepository hymnRepository = new XmlHymnRepository();
                hymn = hymnRepository.GetHymnById(hymnId);
            }

            this.textBlock_Hymn.Text = hymn.Lyric;
            this.textBlock_Title.Text = hymn.Title;
            this.textBlock_TitleNumber.Text = hymn.TitleNumber;
        }
    }
}