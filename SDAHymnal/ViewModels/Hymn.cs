using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Windows.Data;
using System.Xml.Linq;
using System.Xml;
using System.Collections.Generic;

namespace SDAHymnal.ViewModels
{
    public class Hymn
    {
        int id;
        string title;
        string lyric;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        
        public string Title
        {
            get { return title; }
            set
            {
                int len = value.Length;
                title = value.Remove(0, 1).Remove(len-2,1); 
            }
        }

        public string Lyric
        {
            get { return lyric; }
            set { lyric = value; }
        }

        public string FullTitle
        {
            get { return Id + " - " + Title; }
        }

        public string TitleNumber
        {
            get
            {
                if (Id < 10)
                {
                    return "Hino 00" + Id.ToString();
                }
                else if (Id < 100)
                {
                    return "Hino 0" + Id.ToString();  
                }
                else
                {
                    return "Hino " + Id.ToString();  
                }
            }
        }

    }

}
