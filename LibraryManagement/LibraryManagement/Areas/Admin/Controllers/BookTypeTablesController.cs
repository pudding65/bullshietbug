using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LibraryManagement.Models;

namespace LibraryManagement.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BookTypeTablesController : Controller
    {
        private readonly LbmsdbContext _context;

        public BookTypeTablesController(LbmsdbContext context)
        {
            _context = context;
        }

        // GET: Admin/BookTypeTables
        [Route("admin/booktype")]
        public async Task<IActionResult> BookType()
        {
              return _context.BookTypeTables != null ? 
                          View(await _context.BookTypeTables.ToListAsync()) :
                          Problem("Entity set 'LbmsdbContext.BookTypeTables'  is null.");
        }

        // GET: Admin/BookTypeTables/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.BookTypeTables == null)
            {
                return NotFound();
            }

            var bookTypeTable = await _context.BookTypeTables
                .FirstOrDefaultAsync(m => m.BookTypeId == id);
            if (bookTypeTable == null)
            {
                return NotFound();
            }

            return View(bookTypeTable);
        }

        // GET: Admin/BookTypeTables/Create
        [Route("admin/booktype/create")]
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/BookTypeTables/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("BookTypeId,Name")] BookTypeTable bookTypeTable)
        {
            if (ModelState.IsValid)
            {
                _context.Add(bookTypeTable);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(BookType));
            }
            return View(bookTypeTable);
        }

        // GET: Admin/BookTypeTables/Edit/5
        [Route("admin/booktype/edit")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.BookTypeTables == null)
            {
                return NotFound();
            }

            var bookTypeTable = await _context.BookTypeTables.FindAsync(id);
            if (bookTypeTable == null)
            {
                return NotFound();
            }
            return View(bookTypeTable);
        }

        // POST: Admin/BookTypeTables/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("BookTypeId,Name")] BookTypeTable bookTypeTable)
        {
            if (id != bookTypeTable.BookTypeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(bookTypeTable);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BookTypeTableExists(bookTypeTable.BookTypeId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(BookType));
            }
            return View(bookTypeTable);
        }

        // GET: Admin/BookTypeTables/Delete/5
        [Route("admin/booktype/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.BookTypeTables == null)
            {
                return NotFound();
            }

            var bookTypeTable = await _context.BookTypeTables
                .FirstOrDefaultAsync(m => m.BookTypeId == id);
            if (bookTypeTable == null)
            {
                return NotFound();
            }

            return View(bookTypeTable);
        }

        // POST: Admin/BookTypeTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.BookTypeTables == null)
            {
                return Problem("Entity set 'LbmsdbContext.BookTypeTables'  is null.");
            }
            var bookTypeTable = await _context.BookTypeTables.FindAsync(id);
            if (bookTypeTable != null)
            {
                _context.BookTypeTables.Remove(bookTypeTable);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(BookType));
        }

        private bool BookTypeTableExists(int id)
        {
          return (_context.BookTypeTables?.Any(e => e.BookTypeId == id)).GetValueOrDefault();
        }
    }
}
