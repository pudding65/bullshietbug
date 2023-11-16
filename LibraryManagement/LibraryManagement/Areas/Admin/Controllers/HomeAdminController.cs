using LibraryManagement.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using X.PagedList;

namespace LibraryManagement.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/dashboard")]
    public class HomeAdminController : Controller
    {
        LbmsdbContext db = new LbmsdbContext();
        public IActionResult dashboard()
        {
            return View();
        }
        /*[Route("book")]
        public IActionResult Books(int? page)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;

            var lstBooks = db.BookTables.AsNoTracking().Include(b => b.BookType).OrderBy(x => x.BookName).ToList();

            PagedList<BookTable> lst = new PagedList<BookTable>(lstBooks, pageNumber, pageSize);

            return View(lst);
        }*/
        /*[Route("addbook")]
        [HttpGet]
        public IActionResult AddBook()
        {
            return View();
        }
        [Route("addbook")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddBook(BookTable book)
        {
            if (ModelState.IsValid)
            {
                db.BookTables.Add(book);
                db.SaveChanges();
                return RedirectToAction("Books");
            }
            return View(book);
        }*/
    }
}
