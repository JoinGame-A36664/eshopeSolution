using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace eShopSolution.ViewModels.Catalog.Common
{
    public class PagedResult<T>
    {
        public List<T> Item { set; get; }
        public int TotalRecord { set; get; }
    }
}
