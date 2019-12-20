using BanHangDoGo.Controllers;
using CuaHangDoGo.Common;
using CuaHangDoGo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BanHangDoGo.Areas.Controllers
{
    public class CartController : BaseController
    {
        //
        // GET: /Admin/Cart/

        public ActionResult Index()
        {
            var session = (List<CartModel>)Session[CommonConstants.CART];
            ViewBag.TongTien = session != null ? session.Sum(o => o.totalprice) : 0;
            return View(session);
        }

        public ActionResult Order(string product_name, string unit, decimal price, int amount, int id)
        {
            CartModel cart = new CartModel();
            cart.id = id;
            cart.amount = amount;
            cart.price = price;
            cart.unit = unit;
            cart.product_name = product_name;
            cart.totalprice = price * amount;

            var session = (List<CartModel>)Session[CommonConstants.CART];
            if (session == null)
            {
                session = new List<CartModel>();
                session.Add(cart);
            }
            else
            {
                if (session.Select(o => o.id).Contains(cart.id))
                {
                    foreach (var item in session)
                    {
                        if (item.id == cart.id)
                        {
                            item.amount += cart.amount;
                            item.totalprice = item.amount * item.price;
                        }
                    }
                }
                else
                {
                    session.Add(cart);
                }
            }
                
            Session[CommonConstants.CART] = session;
            return RedirectToAction("Index", "Cart");
        }

        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartModel>>(cartModel);
            var sessionCart = (List<CartModel>)Session[CommonConstants.CART];
            if (sessionCart != null)
            {
                foreach (var item in sessionCart)
                {
                    CartModel cart = jsonCart.FirstOrDefault(o => o.id == item.id);
                    if (cart != null)
                    {
                        item.amount = cart.amount;
                        item.totalprice = item.amount * item.price;
                    }
                }
                Session[CommonConstants.CART] = sessionCart;
            }
            else
            {
                List<CartModel> carts = new List<CartModel>();
                carts.AddRange(jsonCart);
                Session[CommonConstants.CART] = carts;
            }

            return Json(new { 
                status = true
            });
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var sessionCart = (List<CartModel>)Session[CommonConstants.CART];
            sessionCart = sessionCart.Where(o => o.id != id).ToList();
            Session[CommonConstants.CART] = sessionCart;
            return RedirectToAction("Index");
        }
    }
}
