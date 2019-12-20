using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CuaHangDoGo.Common
{
    [Serializable]
    public class UserLogin
    {
        public long TypeID { set; get; }
        public long UserID { set; get; }
        public string UserName { set; get; }
    }
}