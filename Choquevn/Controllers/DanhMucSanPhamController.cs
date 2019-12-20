using Models.EF;
using System.Linq;
using System.Web.Mvc;

namespace BanHangDoGo.Controllers
{
    public class DanhMucSanPhamController : BaseController
    {
        //
        // GET: /DanhMucSanPham/

        public ShopDB db = new ShopDB();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ProductByCategory(string tendanhmuc, long id)
        {
            ViewBag.DanhMucSanPham = tendanhmuc.ToUpper();
            var model = db.SanPhams.Where(x => x.DanhMucSanPham.Id == id).OrderByDescending(x => x.Id).Take(6).ToList();
            return View(model);
        }
    }
}
