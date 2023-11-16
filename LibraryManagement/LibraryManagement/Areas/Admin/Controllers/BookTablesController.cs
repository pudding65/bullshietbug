using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LibraryManagement.Models;
using X.PagedList.Mvc.Core;
using X.PagedList;

namespace LibraryManagement.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BookTablesController : Controller
    {
        private readonly LbmsdbContext _context;
        LbmsdbContext db = new LbmsdbContext();

        public BookTablesController(LbmsdbContext context)
        {
            _context = context;
        }

        // GET: Admin/BookTables
        [Route("admin/book/list")]
        public IActionResult Book(int? page)
        {
            int pageSize = 8;
            int pageNumber=page==null||page<0?1:page.Value;
            var lstBook = db.BookTables.AsNoTracking().OrderBy(x => x.BookName).ToList();
            PagedList<BookTable> lst = new PagedList<BookTable>(lstBook,pageNumber,pageSize);
            return View(lst);
        }

        // GET: Admin/BookTables/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.BookTables == null)
            {
                return NotFound();
            }

            var bookTable = await _context.BookTables
                .Include(b => b.AuthorNavigation)
                .Include(b => b.BookType)
                .Include(b => b.User)
                .FirstOrDefaultAsync(m => m.BookId == id);
            if (bookTable == null)
            {
                return NotFound();
            }

            return View(bookTable);
        }

        // GET: Admin/BookTables/Create
        [Route("admin/book/create")]
        public IActionResult Create()
        {
            ViewData["AuthorId"] = new SelectList(_context.AuthorTables, "AuthorId", "AuthorId");
            ViewData["BookTypeId"] = new SelectList(_context.BookTypeTables, "BookTypeId", "BookTypeId");
            ViewData["UserId"] = new SelectList(_context.UserTables, "UserId", "UserId");
            return View();
        }

        // POST: Admin/BookTables/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("BookId,UserId,BookTypeId,AuthorId,BookTitle,ShortDescription,Author,BookName,Edition,TotalCopies,RegDate,Description,PublisherId,Image")] BookTable bookTable)
        {
            if (ModelState.IsValid)
            {
                _context.Add(bookTable);
                await _context.SaveChangesAsync();
                return RedirectToAction("Book");
            }
            ViewData["AuthorId"] = new SelectList(_context.AuthorTables, "AuthorId", "AuthorId", bookTable.AuthorId);
            ViewData["BookTypeId"] = new SelectList(_context.BookTypeTables, "BookTypeId", "BookTypeId", bookTable.BookTypeId);
            ViewData["UserId"] = new SelectList(_context.UserTables, "UserId", "UserId", bookTable.UserId);
            return View(bookTable);
        }

        // GET: Admin/BookTables/Edit/5
        [Route("admin/book/list/edit")]
        [HttpGet]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.BookTables == null)
            {
                return NotFound();
            }

            var bookTable = await _context.BookTables.FindAsync(id);
            if (bookTable == null)
            {
                return NotFound();
            }
            ViewData["AuthorId"] = new SelectList(_context.AuthorTables, "AuthorId", "AuthorId", bookTable.AuthorId);
            ViewData["BookTypeId"] = new SelectList(_context.BookTypeTables, "BookTypeId", "BookTypeId", bookTable.BookTypeId);
            ViewData["UserId"] = new SelectList(_context.UserTables, "UserId", "UserId", bookTable.UserId);
            return View(bookTable);
        }

        // POST: Admin/BookTables/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("BookId,UserId,BookTypeId,AuthorId,BookTitle,ShortDescription,Author,BookName,Edition,TotalCopies,RegDate,Description,PublisherId,Image")] BookTable bookTable)
        {
            if (id != bookTable.BookId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(bookTable);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BookTableExists(bookTable.BookId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("BookType");
            }
            ViewData["AuthorId"] = new SelectList(_context.AuthorTables, "AuthorId", "AuthorId", bookTable.AuthorId);
            ViewData["BookTypeId"] = new SelectList(_context.BookTypeTables, "BookTypeId", "BookTypeId", bookTable.BookTypeId);
            ViewData["UserId"] = new SelectList(_context.UserTables, "UserId", "UserId", bookTable.UserId);
            return View(bookTable);
        }

        // GET: Admin/BookTables/Delete/5
        [Route("admin/book/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.BookTables == null)
            {
                return NotFound();
            }

            var bookTable = await _context.BookTables
                .Include(b => b.AuthorNavigation)
                .Include(b => b.BookType)
                .Include(b => b.User)
                .FirstOrDefaultAsync(m => m.BookId == id);
            if (bookTable == null)
            {
                return NotFound();
            }

            return View(bookTable);
        }

        // POST: Admin/BookTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.BookTables == null)
            {
                return Problem("Entity set 'LbmsdbContext.BookTables'  is null.");
            }
            var bookTable = await _context.BookTables.FindAsync(id);
            if (bookTable != null)
            {
                _context.BookTables.Remove(bookTable);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool BookTableExists(int id)
        {
          return (_context.BookTables?.Any(e => e.BookId == id)).GetValueOrDefault();
        }
    }
}
