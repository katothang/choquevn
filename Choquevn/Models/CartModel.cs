using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CuaHangDoGo.Models
{
    public class CartModel
    {
        public int amount { get; set; }
        public long? id { get; set; }
        public string unit { get; set; }
        public decimal price { get; set; }
        public decimal totalprice { get; set; }
        public string product_name { get; set; }
        public string image { get; set; }
    }
}