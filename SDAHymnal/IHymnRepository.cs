using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SDAHymnal.ViewModels;

namespace SDAHymnal
{
    public interface IHymnRepository
    {
        IList<Hymn> GetHymnList();
        Hymn GetHymnById(int id);
        IList<Hymn> GetHymnListFilterBySentence(string sentence);
    }
}
