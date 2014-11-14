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
using System.Xml.Linq;
using System.Xml;
using System.Collections.Generic;
using SDAHymnal.ViewModels;
using System.ComponentModel;
using System.Threading;
using System.Windows.Controls.Primitives;
using System.Linq;


namespace SDAHymnal
{
    public class XmlHymnRepository : IHymnRepository
    {
        private static List<Hymn> hymnList = null;
        private static XDocument loadedData = XDocument.Load(@"Archive/hymnal.xml");

        static XmlHymnRepository()
        {

            var items = from item in loadedData.Descendants("hymn")
            select new Hymn
            {
                Id = (int)item.Attribute("id"),
                Title = Convert.ToString(item.Element("title").Value),
                Lyric = (string)item.Element("lyric").Value
            };


            hymnList = items.ToList();
        }

        public IList<Hymn> GetHymnList()
        {
            return hymnList;
        }

        public Hymn GetHymnById(int id)
        {
            return hymnList.FirstOrDefault(c => c.Id == id);
        }

        public IList<Hymn> GetHymnListFilterBySentence(string sentence)
        {
            var data = from query in loadedData.Descendants("hymn") //where query.Element
                       where query.Element("title").Value.ToLower().IndexOf(sentence.ToLower()) != -1
                       select new Hymn
                       {
                           Id = (int)query.Attribute("id"),
                           Title = Convert.ToString(query.Element("title").Value),
                           Lyric = (string)query.Element("lyric")
                       };
            return data.ToList();
        }
    }
}
