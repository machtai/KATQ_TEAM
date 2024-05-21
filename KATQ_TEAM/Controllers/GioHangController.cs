using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KATQ_TEAM.Models;
using PayPal.Api;

namespace KATQ_TEAM.Controllers
{
    public class GioHangController : Controller
    {
        Qldienthoai db = new Qldienthoai();

        private Payment payment; // Define the payment variable

        // GET: GioHang

        // Lấy giỏ hàng
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }

        // Thêm giỏ hàng
        public ActionResult ThemGioHang(int iMasp, string strURL)
        {
            Sanpham sp = db.Sanphams.SingleOrDefault(n => n.Masp == iMasp);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.Find(n => n.iMasp == iMasp);
            if (sanpham == null)
            {
                sanpham = new GioHang(iMasp);
                lstGioHang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.iSoLuong++;
                return Redirect(strURL);
            }
        }

        // Cập nhật giỏ hàng 
        public ActionResult CapNhatGioHang(int iMaSP, FormCollection f)
        {
            Sanpham sp = db.Sanphams.SingleOrDefault(n => n.Masp == iMaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMasp == iMaSP);
            if (sanpham != null)
            {
                sanpham.iSoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang");
        }

        // Xóa giỏ hàng
        public ActionResult XoaGioHang(int iMaSP)
        {
            Sanpham sp = db.Sanphams.SingleOrDefault(n => n.Masp == iMaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMasp == iMaSP);
            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.iMasp == iMaSP);
            }
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("GioHang");
        }

        // Xây dựng trang giỏ hàng
        public ActionResult GioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }

        // Tính tổng số lượng
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongSoLuong = lstGioHang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;
        }

        // Tính tổng thành tiền
        private double TongTien()
        {
            double dTongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                dTongTien = lstGioHang.Sum(n => n.ThanhTien);
            }
            return dTongTien;
        }

        // Tạo partial giỏ hàng
        public ActionResult GioHangPartial()
        {
            if (TongSoLuong() == 0)
            {
                return PartialView();
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }

        // Xây dựng 1 view cho người dùng chỉnh sửa giỏ hàng
        public ActionResult SuaGioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }

        // Thanh toán đơn hàng
        public ActionResult ThanhToanDonHang()
        {
            if (Session["use"] == null || Session["use"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "User");
            }

            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            double tongTien = TongTien();
            ViewBag.TongTien = tongTien;
            // Trả về view nhập thông tin giao hàng và chọn phương thức thanh toán
            return View();
        }
        [HttpPost]
        public ActionResult ProcessThanhToanDonHang(string paymentMethod, DonHang model)
        {
            // Lưu địa chỉ nhận hàng vào session
            Session["Diachinhanhang"] = model.Diachinhanhang;
            if (Session["use"] == null || string.IsNullOrEmpty(Session["use"].ToString()))
            {
                return RedirectToAction("Dangnhap", "User");
            }

            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }

            // Save payment method and DonHang model to session
            Session["PhuongThucThanhToan"] = paymentMethod;
            Session["DonHangInfo"] = model;

            switch (paymentMethod)
            {
                case "PayPal":
                    return RedirectToAction("PaymentWithPaypal");
                case "COD":
                    return RedirectToAction("PaymentWithCOD");
                default:
                    return RedirectToAction("GioHang");
            }
        }
        public ActionResult PaymentWithCOD()
        {
            string phuongThucThanhToan = Session["PhuongThucThanhToan"] as string;
            string diaChiNhanHang = Session["Diachinhanhang"] as string; // Lấy địa chỉ từ session

            if (Session["use"] == null || Session["use"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "User");
            }

            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }

            var donHangInfo = Session["DonHangInfo"] as DonHang;
            if (donHangInfo == null)
            {
                return RedirectToAction("ThanhToanDonHang");
            }

            // Create the order in the system
            DonHang ddh = new DonHang();
            Nguoidung kh = (Nguoidung)Session["use"];
            List<GioHang> gh = LayGioHang();
            decimal tongtien = 0;
            foreach (var item in gh)
            {
                decimal thanhtien = item.iSoLuong * (decimal)item.dDonGia;
                tongtien += thanhtien;
            }

            ddh.MaNguoidung = kh.MaNguoiDung;
            ddh.Ngaydat = DateTime.Now;
            ddh.Tongtien = tongtien;
            ddh.Tinhtrang = 2; // COD specific status (doing)
            ddh.Diachinhanhang = Session["Diachinhanhang"] as string; // Lấy địa chỉ từ session
            ddh.PhuongThuc = phuongThucThanhToan;

            // Add order to the database
            db.DonHangs.Add(ddh);
            db.SaveChanges();

            foreach (var item in gh)
            {
                ChitietDonHang ctDH = new ChitietDonHang();
                ctDH.Madon = ddh.Madon;
                ctDH.Masp = item.iMasp;
                ctDH.Soluong = item.iSoLuong;
                ctDH.PhuongThuc = phuongThucThanhToan;
                ctDH.Dongia = (decimal)item.dDonGia;
                ctDH.Thanhtien = item.iSoLuong * (decimal)item.dDonGia; // Lấy thành tiền từ item
                db.ChitietDonHangs.Add(ctDH);
            }
            db.SaveChanges();

            Session["GioHang"] = null;

            return View("SuccessView", ddh);
        }
        public ActionResult PaymentWithPaypal(string Cancel = null)
        {
            APIContext apiContext = PaypalConfiguration.GetAPIContext();
            try
            {
                string phuongThucThanhToan = Session["PhuongThucThanhToan"] as string;
                string diaChiNhanHang = Session["Diachinhanhang"] as string; // Lấy địa chỉ từ session

                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/GioHang/PaymentWithPayPal?";
                    var guid = Convert.ToString((new Random()).Next(100000));
                    var createdPayment = this.CreatePayment(apiContext, baseURI + "guid=" + guid);
                    var links = createdPayment.links.GetEnumerator();
                    string paypalRedirectUrl = null;
                    while (links.MoveNext())
                    {
                        Links lnk = links.Current;
                        if (lnk.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            paypalRedirectUrl = lnk.href;
                        }
                    }
                    Session.Add(guid, createdPayment.id);
                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    var guid = Request.Params["guid"];
                    var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    if (executedPayment.state.ToLower() != "approved")
                    {
                        return View("FailureView");
                    }

                    // Successful payment, create order in the system
                    DonHang ddh = new DonHang();
                    Nguoidung kh = (Nguoidung)Session["use"];
                    List<GioHang> gh = LayGioHang();
                    decimal tongtien = 0;
                    foreach (var item in gh)
                    {
                        decimal thanhtien = item.iSoLuong * (decimal)item.dDonGia;
                        tongtien += thanhtien;
                    }

                    ddh.MaNguoidung = kh.MaNguoiDung;
                    ddh.Ngaydat = DateTime.Now;
                    ddh.Tongtien = tongtien;
                    ddh.Tinhtrang = 1; // PayPal specific status
                    ddh.Diachinhanhang = diaChiNhanHang; // Sử dụng địa chỉ từ session
                    ddh.PhuongThuc = phuongThucThanhToan;

                    // Add order to the database
                    db.DonHangs.Add(ddh);
                    db.SaveChanges();

                    foreach (var item in gh)
                    {
                        ChitietDonHang ctDH = new ChitietDonHang();
                        ctDH.Madon = ddh.Madon;
                        ctDH.Masp = item.iMasp;
                        ctDH.Soluong = item.iSoLuong;
                        ctDH.Dongia = (decimal)item.dDonGia;
                        ctDH.Thanhtien = item.iSoLuong * (decimal)item.dDonGia; // Lấy thành tiền từ item
                        ctDH.PhuongThuc = ddh.PhuongThuc;

                        db.ChitietDonHangs.Add(ctDH);
                    }
                    db.SaveChanges();

                    Session["GioHang"] = null;

                    return View("SuccessView", ddh);
                }
            }
            catch (Exception ex)
            {
                return View("FailureView");
            }
        }



        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution() { payer_id = payerId };
            this.payment = new Payment() { id = paymentId };
            return this.payment.Execute(apiContext, paymentExecution);
        }

        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            var itemList = GetPayPalItems();
            var payer = new Payer() { payment_method = "paypal" };
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&Cancel=true",
                return_url = redirectUrl
            };
            var details = new Details() { tax = "1", shipping = "1", subtotal = CalculateSubtotal(itemList.items).ToString() };
            var amount = new Amount() { currency = "USD", total = CalculateTotal(details).ToString(), details = details };
            var transactionList = new List<Transaction>();
            transactionList.Add(new Transaction()
            {
                description = $"Invoice #{DateTime.Now.Ticks}",
                invoice_number = DateTime.Now.Ticks.ToString(),
                amount = amount,
                item_list = itemList
            });

            payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };

            return payment.Create(apiContext);
        }

        private ItemList GetPayPalItems()
        {
            List<Item> itemList = new List<Item>();
            List<GioHang> cartItems = (List<GioHang>)Session["GioHang"];
            if (cartItems != null)
            {
                foreach (var item in cartItems)
                {
                    itemList.Add(new Item()
                    {
                        name = item.sTensp,
                        currency = "USD",
                        price = item.dDonGia.ToString(),
                        quantity = item.iSoLuong.ToString(),
                        sku = item.iMasp.ToString(),
                    });
                }
            }
            return new ItemList() { items = itemList };
        }

        private decimal CalculateSubtotal(List<Item> itemList)
        {
            decimal subtotal = 0;
            foreach (var item in itemList)
            {
                decimal price = decimal.Parse(item.price);
                int quantity = int.Parse(item.quantity);
                subtotal += price * quantity;
            }
            return subtotal;
        }

        private decimal CalculateTotal(Details details)
        {
            decimal subtotal = decimal.Parse(details.subtotal);
            decimal tax = decimal.Parse(details.tax);
            decimal shipping = decimal.Parse(details.shipping);
            return subtotal + tax + shipping;
        }

        public ActionResult FailureView()
        {
            return View();
        }

        public ActionResult SuccessView()
        {
            return View();
        }
    }
}
